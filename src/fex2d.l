/*
    Exercicio 2b
*/

%option noyywrap
%{
#define BUFFER_SIZE 64
#define CURRENCY_SIZE 128
int reals = 0;
char values[BUFFER_SIZE][CURRENCY_SIZE];
int nvals = 0;
%}

%%
"R"\$[ \t]*[0-9]+,[0-9]{2}   { reals++; strncpy(values[nvals++], yytext, CURRENCY_SIZE); }

%%
int main(int argc, char **argv) {
    int i;

    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return 1;
        }
    }

    yylex();
    printf("%d valores em reais identificados:\n", reals);
    for (i = 0; i < nvals; i++)
        printf("\t<%s>\n", values[i]);

    return 0;
}