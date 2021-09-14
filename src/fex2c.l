/*
    Exercicio 2b
*/

%option noyywrap
%{
int vowels = 0;
int cons = 0; // consoantes
%}

%%
"a"|"e"|"i"|"o"|"u"|"A"|"E"|"I"|"O"|"U"   { vowels++; }
[a-zA-Z]   { cons++; }

%%
int main(int argc, char **argv) {
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return 1;
        }
    }

    yylex();
    printf("%d vogais, %d consoantes", vowels, cons);

    return 0;
}