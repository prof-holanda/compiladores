/* 
   Calculadora de expressão aritmética em notação polonesa reversa
*/

%{
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

#include "if.h"

static struct sym symtab[MAXSYMS];
static int nsyms = 0;

int yydebug = 1;

/* flex */
extern int yylineno;

extern int yyerror (char const *msg, ...);
extern int yylex();

%}

/* bison: declarações */
%union {
        int i;
        char *s;
        enum logical_op_enum lop;
}

%token T_IF T_ELSE T_ELSE_IF T_VAR
%token T_LPAREN T_RPAREN
%token  <lop> T_EQ T_NEQ T_GT T_GEQ T_LT T_LEQ T_LOR T_LAND
%token  <i> T_INTEGER
%token  <s> T_ID
%type   <lop> logical_op
%type   <i> assign 
%type   <i> ctlflow
%type   <i> cond 

%start  program

/* Gramatica */
%%
program     : block                     { return 0; }
            ;

block       : T_VAR assign_list ctlflow { printf("result=%d\n", $3); }
            |
            ;

assign      : T_ID '=' T_INTEGER ';'    { assign($1, &$3, NULL); }
            | T_ID '=' T_ID ';'         { assign($1, NULL, $3); }
            ;

assign_list : assign
            | assign_list assign
            ;

cond        : T_ID logical_op T_ID              { $$ = leval($2, $1, NULL, $3, NULL); }
            | T_ID logical_op T_INTEGER         { $$ = leval($2, $1, NULL, NULL, &$3); }
            | T_INTEGER logical_op T_ID         { $$ = leval($2, NULL, &$1, $3, NULL); }
            | T_INTEGER logical_op T_INTEGER    { $$ = leval($2, NULL, &$1, NULL, &$3); }            
            ;

logical_op  : T_EQ        { $$ = EQ; }
            | T_NEQ       { $$ = NEQ; }
            | T_GT        { $$ = GT; }
            | T_GEQ       { $$ = GEQ; }
            | T_LT        { $$ = LT; }
            | T_LEQ       { $$ = LEQ; }
            | T_LOR       { $$ = LOR; }
            | T_LAND      { $$ = LAND; }
            ;            

ctlflow     : T_IF cond T_LPAREN assign T_RPAREN       
              T_ELSE T_LPAREN assign T_RPAREN
                                        {
                                          if ($2) { $$ = $4; }
                                          else { $$ = $8; }
                                        }
            | T_IF cond T_LPAREN assign T_RPAREN
              T_ELSE_IF cond T_LPAREN assign T_RPAREN
              T_ELSE T_LPAREN assign T_RPAREN          
                                        {
                                          if ($2) { $$ = $4; }
                                          else if  ($7) { $$ = $9; }
                                          else { $$ = $13; }
                                        }
            ;
%%
#include "lex.yy.c"

int yyerror(const char *msg, ...) {
	va_list args;

	va_start(args, msg);
	vfprintf(stderr, msg, args);
	va_end(args);

	exit(EXIT_FAILURE);
}

static struct sym *lookup(char *id) {
    struct sym *p;
    int i;

    for (i = 0; i < nsyms; i++) {
        p = &symtab[i];
        if (strncmp(p->id, id, MAXTOKEN) == 0)
            break;
    }

    if (p == NULL) {
        p = &symtab[nsyms++];
        strncpy(p->id, id, MAXTOKEN);
        p->val = 0;
    }
    return p;
}

int leval(enum logical_op_enum lop, char *lsym, int *lval, 
          char *rsym, int *rval) {
    int i, *pi, l, r, ret;
    char *id;
    struct sym *p;
    char *syms[2] = {lsym, rsym};
    int  *vals[2] = {lval, rval};
    int terms[2] = {0, 0};

    for (i = 0; i < 2; i++) {
        id = syms[i];
        pi = vals[i];
        if (id) {
            p = lookup(id);
            terms[i] = p->val;
        } else if (pi) {
            terms[i] = *pi;
        } else {
            yyerror("error: wrong logical evaluation at line %d\n", yylineno);
        }
    }
    l = terms[0], r = terms[1];

    switch(lop) {
        case EQ:    return l == r; break;
        case NEQ:   return l != r; break;
        case GT:    return l >  r; break;
        case GEQ:   return l >= r; break;
        case LT:    return l <  r; break;
        case LEQ:   return l <= r; break;
        case LOR:   return l || r; break;
        case LAND:  return l && r; break;
        default: 
            yyerror("error: undefined logical operator: %d\n", lop); 
            break;
    }
    return 0;
}

void assign(char *lsym, int *pi, char *rsym) {
    struct sym *p, *q;

    p = lookup(lsym);
    if (pi)
        p->val = *pi;
    else if (rsym) {
        q = lookup(rsym);
        p->val = q->val;
    } else
        yyerror("error: assignment error at line %d\n", yylineno);
}

int main (int argc, char **argv) {
        FILE *fp;
        int i;
        struct sym *p;

        if (argc <= 0)
                yyerror("usage: %s file.xyz\n", argv[0]);

        fp = fopen(argv[1], "r");
        if (!fp)
                yyerror("error: could not open %s.\n", argv[1]);

        yyin = fp;
        do {
                yyparse();
        } while(!feof(yyin));

        for (i = 0; i < nsyms; i++) {
                p = &symtab[i];
                printf("%s=%d\n", p->id, p->val);
        }

        return EXIT_SUCCESS;
}