---
title: Usando `flex` e `bison`
author: Adriano J. Holanda
date 2021-09-10
---

# Exercícios

## `flex`

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

## Referência

- Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman. [Compiladores: Princípios, Técnicas e Ferramentas](https://www.amazon.com.br/Compiladores-princ%C3%ADpios-ferramentas-Alfred-Aho/dp/8588639246). Editora Pearson, 2a edição, 2007.
