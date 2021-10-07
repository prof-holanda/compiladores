/* 
   Calculadora de expressão aritmética em notação infixa
*/

%{
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

/* flex */
extern int yylineno;

extern int yyerror (char const *msg, ...);
extern int yylex();

%}

/* bison: declarações */
%union {
        float f;
}
%token <f> NUMBER
%type  <f> expr term factor

/* Gramatica */
%%
calc:   expr                { printf("%f\n", $1); }
        ;

expr:   expr '+' term       { $$ = $1 + $3; }
        | expr '-' term     { $$ = $1 + $3; }
        | term              { $$ = $1; }
        ;

term:   term '*' factor     { $$ = $1 * $3; }
        | term '/' factor   { $$ = $1 / $3; }
        | factor            { $$ = $1; }
        ;

factor: '(' expr ')'        { $$ = $2; }
        | '-' factor        { $$ = -$2; }
        | NUMBER            { $$ = $1; }
        ;
%%

int yyerror(const char *msg, ...) {
	va_list args;

	va_start(args, msg);
	vfprintf(stderr, msg, args);
	va_end(args);

	exit(EXIT_FAILURE);
}

int main (int argc, char **argv) {
        return  yyparse();
}