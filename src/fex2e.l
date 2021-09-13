/*
    Exercicio 2e
*/

%option noyywrap
%{
int keywords = 0;
int funcs = 0;
int numbers = 0;
int spchars = 0;
%}

%%
"char"|"int"|"float"|"long"|"double"        { /* do nothing */}
"if"|"else"|"while"|"do"|"switch"|"case"    { keywords++; }
"!"|"@"|"*"|"&"|"|"|"%"|"$"|"#"             { spchars++; printf("\n\n>%s<\n\n", yytext); }
[a-zA-Z][a-zA-Z0-9_][ \t]*\(.*\)[ \t\n]*\{  { funcs++; }
[0-9]+                                      { numbers++; }

%%
int main(int argc, char **argv) {
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return 1;
        }
    } else {
        fprintf(stderr, "usage: %s file.c\n", argv[0]);
        exit(1);
    }

    yylex();
    printf("%d palavra(s) reservada(s), %d caracteres especiais, %d funcoes, %d numero(s)", 
            keywords, spchars, funcs, numbers);

    return 0;
}