---
title: Usando `flex` e `bison`
author: 
- Adriano J. Holanda
- Zhao Liang
date: 
- 2021-09-20
---

# Exercícios

## `lex`

1. Descreva o comportamento das expressões regulares a 
seguir e dê alguns exemplos de *strings* que se encaixam em 
cada padrão.

a) `[+-]*[0-9]+\.[0-9]+`

b) `[1-9][0-9]*|0`

c) `[A-Z]+`

d) `[a-zA-Z_]+`

e) `[a-zA-Z][a-zA-Z0-9_]*`

f) `[az-]+`

g) `"[a-z]"`

h) `[0-9]+[ \t]*\*[ \t]*[0-9]+`

i) `x(cachorro|gato)x`

j) `cachorro.*gato`

k) `[gato]`

l) `[gato]+`

m) `(ab|cd)?(ef)*`

n) `(a|b)*a(a|b)`

o) `(a|b)*a(a|b)(a|b)`

p) `(a|b)*a(a|b)(a|b)(a|b)`

q) `(abcd|abc)/d`

r) `(a|ab)/ba`

s) `aa*|a*`

t) `[\^\+\-\:\*\]]`

2) Implemente os seguintes programas usando o analisador léxico `flex`.

a) Imprima o número de palavras que comecem com letras maiúsculas de um 
texto fornecido pela entrada-padrão ou arquivo (daqui pra frente só texto fornecido).

b) Imprima o número de letras maiúsculas, minúsculas e números em um texto fornecido.

c) Imprima o número de vogais e consoantes em um texto fornecido.

d) A partir de um texto fornecido, imprima os valores existentes no texto 
em moeda brasileira, por exemplo, `R$ 12,50`, `R$312,78` ou `R$ 0,62`. 
Se a entrada fornecida for

```
A calça original custa R$ 78,50, porém o terno custa em
torno de R$700,00 a   R$  1250,00. A camisa social sai 
em torno de R$ 73,25. Se o pagamento for em cartão há
uma taxa adicional de R$ 0,80 a R$ 5,00.
```

o programa deverá imprimir

```
R$ 78,50
R$700,00
R$  1250,00
R$ 73,25
R$ 0,80
R$ 5,00
```

Dica: utilize um _buffer_ (vetor de _strings_) para armazenar os 
textos contendo os valores.

e) Receba um arquivo contendo código fonte em C e imprima a quantidade de:
    - palavras reservadas: `if`, `else`, `while`, `do`, `switch` e `case`;
    - funções;
    - números inteiros;
    - caracteres especiais: "`!`", "`@`", "`*`", "`&`", "`|`", "`%`", "`$`" e "`#`".

Após a compilação do programa e supondo que o binário gerado 
chama-se `a.exe` (Windows) ou `a.out` (Linux), 
forneça um arquivo com código C como argumento 
da seguinte forma no terminal (PowerShell, bash, ...):

```
# Windows
.\a.exe arquivo.c
# Linux
./a.out arquivo.c
```

## `yacc`

1. Escreva um programa de "calculadora de mesa" `yacc` que avalie
expressões aritméticas usando a [notação polonesa inversa](https://pt.wikipedia.org/wiki/Nota%C3%A7%C3%A3o_polonesa_inversa). 

2. Escreva um programa de "calculadora de mesa" `yacc` que avalie
expressões aritméticas usando a notação da linguagem 
[LISP](https://pt.wikipedia.org/wiki/Lisp), 
com a lista limitada a dois operandos. Por exemplo, a expressão

```
(/ (* (- 3 1) 4) 2)
```

tem como sequência de avaliação

```
(/ (* 2 4) 2) =
(/ 8 2) =
4
```


3. [Aho] Escreva um programa de "calculadora de mesa" `yacc` que avalie
expressões Booleanas tendo como operações

`'|'` &#8594; `OR`<br>
`'&'` &#8594; `AND`<br>
`'^'` &#8594; `XOR`<br>
`'~'` &#8594; `NOT`<br>

onde o operador unário `'~'` possui maior precedência sobre os demais 
operadores, sendo que estes possuem mesma precedência excetuando se 
a expressão estiver entre parênteses. Por exemplo, a expressão

```
0 ^ (1 | 0) | ~0 
```
tem como sequência de avaliação

```
0 ^ (1 | 0) | 1 =
0 ^ 1 | 1 =
1 | 1 =
1
```

### Solução
[[1]](https://github.com/prof-holanda/compiladores/tree/bison/yacc/03-calc)]
[[2]](https://github.com/prof-holanda/compiladores/tree/bison/yacc/04-calc)]
[[3]](https://github.com/prof-holanda/compiladores/tree/bison/yacc/05-bool)]

## Referência

- Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman. [Compiladores: Princípios, Técnicas e Ferramentas](https://www.amazon.com.br/Compiladores-princ%C3%ADpios-ferramentas-Alfred-Aho/dp/8588639246). Editora Pearson, 2a edição, 2007.
