%{
#include <stdlib.h>
#include "if.tab.h"

extern int yyerror (char const *msg, ...);

%}
T_ID            [a-zA-Z][a-zA-Z0-9_]*

%option noyywrap nodefault yylineno
%%
"if"            return T_IF;
"else"          return T_ELSE;
"else if"       return T_ELSE_IF;
"{"             return T_LPAREN;
"}"             return T_RPAREN;
"=="            return T_EQ;
"!="            return T_NEQ;
">"             return T_GT;
">="            return T_GEQ;
"<"             return T_LT;
"<="            return T_LEQ;
"||"            return T_LOR;
"&&"            return T_LAND;
"var"           return T_VAR;
'+'             return T_ADD;
'-'             return T_SUB;
'%'             return T_MOD;
'*'             return T_MUL;
'\/'             return T_MUL;
[0-9]+          { yylval.i = atoi(yytext); return T_INTEGER; }
{T_ID}          { yylval.s = strdup(yytext); return T_ID; }
[=;]          { return yytext[0]; }
[ \t\n]         { ; }
.               { yyerror("unknown token %s\n", yytext); }
%%

