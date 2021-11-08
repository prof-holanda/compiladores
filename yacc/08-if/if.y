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
        char c;
        int i;
        char *s;
        enum logical_op_enum lop;
}

%token T_IF T_ELSE T_ELSE_IF T_VAR
%token T_LPAREN T_RPAREN
%token T_ADD T_SUB T_MUL T_DIV T_MOD
%token T_EQ T_NEQ T_GT T_GEQ T_LT T_LEQ T_LOR T_LAND
%token T_INTEGER
%token T_ID

%left T_MUL T_DIV T_MOD T_AND
%left T_ADD T_SUB T_LOR
%left T_EQ T_NEQ T_GEQ T_GT T_LEQ T_LT

%start  program

/* 
    Gramatica 
    expr  - algebric expression
    op    - algebric operator 
    lop   - logical operator
    lexpr - logical expression    
*/
%%
program     : block                     { return 0; }
            ;

block       : T_VAR assign_list ctlflow
            |
            ;

assign      : T_ID '=' expr ';'
            ;

assign_list : assign
            | assign_list assign
            ;

cmp         : expr cmp_tks expr
            ;

cmp_tks     : T_EQ
            | T_NEQ
            | T_GT
            | T_GEQ
            | T_LT
            | T_LEQ
            ;

expr        : term
            | expr T_ADD term
            | expr T_SUB term
            | expr T_LOR term
            ;

term        : factor
            | term T_MUL factor
            | term T_LAND factor
            | term T_DIV factor
            | term T_MOD factor
            ;

factor      : T_ID
            | T_INTEGER
            ;

ctlflow     : T_IF cmp T_LPAREN assign_list T_RPAREN       
              T_ELSE T_LPAREN assign_list T_RPAREN
            | T_IF cmp T_LPAREN assign_list T_RPAREN
              T_ELSE_IF cmp T_LPAREN assign_list T_RPAREN
              T_ELSE T_LPAREN assign_list T_RPAREN          
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

int main (int argc, char **argv) {
        FILE *fp;

        if (argc <= 0)
                yyerror("usage: %s file.xyz\n", argv[0]);

        fp = fopen(argv[1], "r");
        if (!fp)
                yyerror("error: could not open %s.\n", argv[1]);

        yyin = fp;
        do {
                yyparse();
        } while(!feof(yyin));

        return EXIT_SUCCESS;
}