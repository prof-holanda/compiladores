/* 
   Avaliacao simbolica de expressoes aritmeticas
*/

%{
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

/* tabela de simbolos */
#include "symtab.h"

struct symtab *head = NULL;
int nsyms = 0; /* number of symbols */

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
        char *s;
        struct symtab *sym;
}

%token  <d> T_REAL
%token  <s> T_ID
%token  <c> T_OP
%type   <d> assign

/* 
   Gramatica 
   decl - declaration (declaração) 
   expr - expression (expressao)
   var - variable (variável)
*/

%%
decls   :  assign                     {printf("%g\n", $1); }                  
        ;

assign  : T_ID  T_REAL               { $$ = $2; }
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

Bool lookup(char *id) {
        int i;

        return false;
}


struct symtab *install(char *id, double val) {

        return NULL;
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