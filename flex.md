% Análise léxica usando `flex`
% Adriano J. Holanda e Zhao Liang
% 2021-09-10

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
   `[a-bA-B]+`          combina com qualquer conjunto de letras
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
   `^[a2-9tjqk]{5}$`    combina linhas que contenham strings de tamanho 5
                        que comecem com `a` ou `2` e terminem com `9`,
                        `t`, `j`, `q` ou `k` - `akt5q`, `727ak`, ~~`akt5e`~~
                        ~~`akt`~~

# Referências

- John Levine. [flex & bison](https://www.oreilly.com/library/view/flex-bison/9780596805418/). Editora O'Reilly, 2009.
- David Hanson, Christopher Fraser. [A Retargetable C Compiler: Design and Implementation](https://www.amazon.com.br/Retargetable-Compiler-Design-Implementation/dp/0805316701). Editora Addison-Wesley, 1995.
-  Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman. [Compiladores: Princípios, Técnicas e Ferramentas](https://www.amazon.com.br/Compiladores-princ%C3%ADpios-ferramentas-Alfred-Aho/dp/8588639246). Editora Pearson, 2a edição, 2007.
