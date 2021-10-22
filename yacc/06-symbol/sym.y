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

extern double eval(char op, double x, double y);

/* 
  To debug, uncomment and run 
  bison --verbose --debug -d file.y 
*/
int yydebug = 1;

%}
%union {
        char c;
        double d;
        int i;
}
%token  <d> CONST
%token  <i> VAR
%token   <c> OP
%type   <d> assign expr stmt

/* 
   Gramatica 
   stmt - statement (proposiçao) 
   expr - expression (expressao)
*/

%%
stmt_l  : stmt '\n'                     { printf("%g\n", $1); } 
        | stmt_l stmt '\n'
        | VAR '\n'                      { printf("%g\n", $1); }      
        ;

stmt    : VAR '=' CONST                 { $$ = $3; printf("const %g\n", $3); } 
        | assign                        { $$ = $1; printf("assign %g\n", $1);}
        ;

assign  : VAR '=' VAR                   { $$ = sym[$1] = sym[$3]; }
        | VAR '=' expr                  { $$ = sym[$1] = $3; }
        ;

expr    : VAR OP VAR                    { $$ = eval($2, sym[$1], sym[$3]); }
        | expr OP VAR                   { $$ = eval($2, $1, sym[$3]); }
        | '(' expr ')'                  { $$ = $2; }
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

double eval(char op, double x, double y) {
        double v;

        switch(op) {
                case '+': v = x + y; break;
                case '-': v = x - y; break;
                case '*': v = x * y; break;
                case '/': 
                        if (y != 0.0)
                                v = x / y;
                        else
                                yyerror("fatal error: division by zero at line %d\n", yylineno);
                        break;
                default:
                        yyerror("fatal error: unknown operator %c\n", op);
                        break;
        }
        return v;
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