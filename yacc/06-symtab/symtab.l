
%{
#include <stdlib.h>
#include "symtab.tab.h"

#include "symtab.h"

extern int yyerror (char const *msg, ...);
%}

T_ID        [a-zA-Z][a-zA-Z0-9_]*
T_NEWLINE   [\n]
T_OP        [-+*/]
T_REAL      [0-9]+\.?|[0-9]*\.[0-9]+
T_SPACE     [ \t\n]
%option noyywrap nodefault yylineno
%%
{T_OP}                          { yylval.c = yytext[0]; return T_OP;}
{T_ID}                          { yylval.s = yytext; return T_ID; }
{T_REAL}                        { yylval.d = atof(yytext); return T_REAL; }
{T_SPACE}                       { ; }
.                               { yyerror("unknown token %s\n", yytext); }
%%
