
%{
#include <stdlib.h>
#include "calc.tab.h" // yacc -d calc.y

extern int yyerror (char const *msg, ...);
%}

%option noyywrap nodefault yylineno
%%
[0-9]+(\.[0-9]+)?([eE][0-9]+)?      { yylval.f = atof(yytext); return NUMBER; }
[-+()*/]                            { return yytext[0]; }
[ \t\n]                             { ; }
.                                   { yyerror("unknown token %s\n", yytext); }
%%

