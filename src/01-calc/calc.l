
%{
#include "calc.tab.h"

extern void yyerror (char const *s, ...);
%}

%option noyywrap nodefault yylineno
%%
"+" |
"-" |
"*" |
"/"         { return yytext[0]; }
[0-9]+      { yylval.d = atof(yytext); return NUMBER; }
\n          { return EOL; }
[ \t]       { /* ignore spaces */}
.           { yyerror("error: unknown token %c\n", *yytext); }
%%

