#ifndef LEXYACC_H
#define LEXYACC_H

/* define lex variables and subroutines ahead */
extern int yylineno;

extern void yyerror (char const *s, ...);
extern int yylex ();

#endif