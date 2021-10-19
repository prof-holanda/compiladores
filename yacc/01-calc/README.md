# Calculadora de mesa simples

O código deste diretório contém o analisador sintático 
para a construção de uma calculadora de mesa com a 
seguinte gramática para expressões aritméticas:

`E` &#8594; `E + T | T` <br>
`T` &#8594; `T * F | F` <br>
`F` &#8594; `(E) | DIGIT` <br>

onde o _token_ `DIGIT` é um único dígito entre 0 e 9.

---
O material contido neste diretório foi adaptado do livro ["Compiladores..."](https://www.amazon.com.br/dp/B00US12GMG).

