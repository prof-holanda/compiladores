/* 
    Example 3-1 from "flex & bison" book.
    An improved calculator.
*/

%{
#define YYSTYPE double
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

struct ast {
        int nodetype;
        struct ast *l;
        struct ast *r;
};

struct numval {
        int nodetype;
        double number;
}

extern struct ast *new_num(int i);
extern struct ast *ast_new(int nodetype, struct ast *l, struct ast *r);
extern void ast_free(struct ast*);

/* flex */
extern int yylineno;

extern void yyerror (char const *s, ...);
extern int yylex();

#define YYSTYPE struct ast *
%}

%union {
        struct ast *a;
        double d;
}

/* BISON Declarations */
%type   <a> exp factor term
%token  <d> NUMBER
%token  EOL
%token  NEG

/* Grammar follows */
%%
calclist:    /* none */
        | calclist exp EOL {
                printf("= %4.4g\n", eval($2));
                ast_free($2)
                printf("> ");
        }
        | calclist EOL { printf("> "); }
;

exp: factor
   | exp '+' factor     { $$ = ast_new('+', $1, $3); } 
   | exp '+' factor     { $$ = ast_new('-', $1, $3); } 
;

factor: term
   | factor '*' term    { $$ = ast_new('+', $1, $3); } 
   | factor '/' term    { $$ = ast_new('-', $1, $3); } 
;

term: NUMBER { $$ newnum($1); }
   | '|' term           { $$ = ast_new('|', $2, NULL); } 
   | '(' exp ')'        { $$ = $2; }
   | '-' term           { $$ = ast_new('M', $2, NULL); } 
;
%%

void yyerror (const char *s, ...) {
    va_list ap;
    va_start(ap, s);
    fprintf (stderr, "%d error:", yylineno);
    vfprintf(stderr, s, ap);
    fprintf(stderr, "\n");
}

static struct ast *ast_alloc() {
        struct ast *a = malloc(sizeof(struct ast));

        if (!a) {
                yyerror("error: memory allocation failed\n");
                exit(EXIT_FAILURE);
        }
        return a;
}

struct ast *ast_new(int nodetype, struct ast *l, struct ast *r) {
        struct ast *a = ast_alloc();

        a->nodetype = nodetype;
        a->l = l;
        a->r = r;

        return a;
}

struct ast *num_new(double d) {
        struct numval *a = (struct numval*)ast_alloc();

        a->nodetype = 'K';
        a->number = d;

        return (struct ast*)a;
}

void ast_free(struct ast *a) {
        // TODO: implement
}

int main (int argc, char **argv) {
  return  yyparse();;
}