
%{
#include <stdlib.h>
#include "sym.tab.h"

extern int yyerror (char const *msg, ...);
%}

%option noyywrap nodefault yylineno
%%
[a-z]                           { yylval.i = (int)*yytext - 'a'; return VAR; }
[0-9]+\.?|[0-9]*\.[0-9]+        { yylval.d = atof(yytext); return CONSTANT; }
[-;+*/()=]                    { return yytext[0]; }
[ \t\n]                         { ; }
.                               { yyerror("unknown token %s\n", yytext); }
%%

