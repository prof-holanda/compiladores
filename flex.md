% Análise léxica usando `flex`
% Adriano J. Holanda e Zhao Liang
% 2021-09-10

# História e princípios

- [`bison`](https://www.gnu.org/software/bison/) 
descende do [`yacc`](https://pt.wikipedia.org/wiki/Yacc) 
desenvolvido por 
[Stephen C. Johnson](https://en.wikipedia.org/wiki/Stephen_C._Johnson) 
entre 1975 e 1978 no 
[Bell Labs](https://pt.wikipedia.org/wiki/Bell_Labs).
- Johnson trabalhou em estreita colaboração com 
[ALfred Aho](https://en.wikipedia.org/wiki/Alfred_Aho)
e sob a base teórica sólida do trabalho de 
[Don E. Knuth](https://www-cs-faculty.stanford.edu/~knuth/)
na área de compiladores.
- Uma das motivações era desenvolver extensões para o 
programa [`troff`](https://en.wikipedia.org/wiki/Troff)
usando a filosofia 
[`Unix`](https://en.wikipedia.org/wiki/Unix_philosophy).
- `flex` descende do `lex` desenvolvido por 
[Mike Lesk](https://en.wikipedia.org/wiki/Mike_Lesk)
e [Eric Schmidt](https://en.wikipedia.org/wiki/Eric_Schmidt)
em 1975 no Bell Labs.

# Criando um analisador léxico

![](img/lex-compilador.png)

# Seções do arquivo

definições

%%

regras

%%

código

# Regras - expressões regulares

- Caracteres especiais:

    expressão     descrição do padrão
  -------------   ---------------------
   `.`            combina com qualquer caracter, com exceção do '`\n`'
   `[]`           classe de caracteres: combina com qualquer 
                  caracter dentro do colchetes
   `^`            combina a expressão regular que o segue no 
                  início da linha
   `$`            combina a expressão regular que o precede no 
                  início da linha
   `{}`           especifica o número mínimo e máximo de vezes
                  que a expressão que o precede pode combinar
   `*`            combina com **zero** ou mais cópias da expressão 
                  que o precede pode combinar
   `+`            combina com **uma** ou mais cópias da expressão 
                  que o precede pode combinar
   `?`            combina com zero ou uma cópia da expressão 
                  que o precede pode combinar

# Regras - expressões regulares (cont.)

- Caracteres especiais:

    expressão     descrição do padrão
  -------------   ---------------------
   `\`            usado para mudar a classe dos caracteres
                  especiais, por exemplo, `\*` combina com
                  o caracter asterisco
   `|`            operador de alternância
   `"..."`        a expressão dentro das aspas é tratada
                  literalmente
   `()`           agrupa um conjunto de expressões
   `/`            combina somente se a expressão antes e depois
                  da barra combinarem

# Exemplo - expressões regulares 

    expressão           descrição do padrão
  -------------------   ---------------------
   `.+`                 combina com qualquer caracter
   `[a-zA-Z]+`          combina com qualquer conjunto de letras
                        maiúsculas ou minúsculas - `abc`, `AbC`, `zZz`
   `[0-9]+`             combina com qualquer sequência de números -
                        `0`, `12`, `5633`, `1111`
  `-?[0-9]`             combina com número inteiro precedido ou não
                        por um sinal `-`
   `a(bc|de)`           combina com `abc` ou `ade`
   `0/1`                combina com `0` na string `01` mas não `0` ou `02`
   `b{1,4}`             combina de 1 a 4 ocorrências da letra `b`
   `2{5}`               combina com 5 ocorrências do número `2`
   `[ \t]*`             combina opcionalmente espaços e tabulações
   `^a|o$`              combina linhas que contenham strings 
                        onde a primeira letra seja `a` ou a última letra seja `o` 
                        - "`andar\n`", "`mercado pago\n`", "~~`sem novidade\n`~~"

# Usando `flex`

- Fluxo de compilação

 ```
$ lex -o arquivo.yy.c arquivo.l
$ gcc -o arquivo.exe arquivo.yy.c
 ```

- Variáveis e funções internas

  |**variável ou função**   |  **descrição**                                     |
  |:------------------------|:---------------------------------------------------|
  |`yylex()`                |  realiza leitura dos caracteres de entrada         |
  |`yyin`                   |  deve receber o ponteiro para o arquivo a ser lido |

# Referências

- John Levine. [flex & bison](https://www.oreilly.com/library/view/flex-bison/9780596805418/). Editora O'Reilly, 2009.
- David Hanson, Christopher Fraser. [A Retargetable C Compiler: Design and Implementation](https://www.amazon.com.br/Retargetable-Compiler-Design-Implementation/dp/0805316701). Editora Addison-Wesley, 1995.
- Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman. [Compiladores: Princípios, Técnicas e Ferramentas](https://www.amazon.com.br/Compiladores-princ%C3%ADpios-ferramentas-Alfred-Aho/dp/8588639246). Editora Pearson, 2a edição, 2007.
