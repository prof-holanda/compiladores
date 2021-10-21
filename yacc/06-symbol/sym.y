/* 
   Avaliacao simbolica de expressoes aritmeticas
*/

%{
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

/* tabela de simbolos */
int sym[26];
/* flex */
extern int yylineno;

extern int yyerror (char const *msg, ...);
extern int yylex();

/* 
  To debug, uncomment and run 
  bison --verbose --debug -d file.y 
*/
int yydebug = 1;

%}
%union {
        double d;
        int i;
}
%token  <d> CONSTANT
%token  <i> VAR
%type   <d> expr expr_l stmt
%left   '+' '-'
%left   '*' '/'

/* 
   Gramatica 
   stmt - statement (proposiçao) 
   expr - expression (expressao)
*/

%%
stmt_l  : stmt ';'              { printf("%g\n", $1); } 
        | stmt_l stmt ';' 
        ;

stmt    : VAR '=' CONSTANT      { $$ = sym[$1] = $3; printf("%g\n", $3); }
        | VAR '=' expr_l        { $$ = sym[$1] = $3; }
        ;

expr_l  : expr
        | expr_l expr
        ;

expr    : VAR '+' VAR           { $$ = sym[$1] + sym[$3]; } 
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

        return yyparse();

        if (argc <= 0)
                yyerror("usage: %s file\n", argv[0]);

        fp = fopen(argv[1], "r");
        if (!fp)
                yyerror("error: could not open %s.\n", argv[1]);

        yyin = fp;
        do {
                yyparse();
        } while(!feof(yyin));

        return EXIT_SUCCESS;
}