# Checagem de tipos

O analisador deste diretório faz a checagem do tipos de 
uma linguagem hipotética onde:

------------------------
tipo    | descrição
--------|-----------------
i64     | inteiro de 64 bits
i32     | inteiro de 32 bits
i16     | inteiro de 16 bits
i8      | inteiro de 8 bits
u64     | inteiro de 64 bits sem sinal
u32     | inteiro de 32 bits sem sinal
u16     | inteiro de 16 bits sem sinal
u8      | inteiro de 8 bits sem sinal
f64     | ponto flutuante de 64 bits
f32     | ponto flutuante de 32 bits
char    | caracter
str     | _string_
bool    | Booleano `true` ou `false`

A palavra reservada `var` marca o início da declaração 
das variáveis, sendo que todas as variáveis devem ser 
inicializadas. Cada variável ou variáveis do mesmo tipo 
devem ser declaradas uma por linha.

A linguagem permite atribuição dupla na declaração, por exemplo:

```
var
    p, q : i64 = 1000, 20000;
    r    : i32 = 800;
```

declara as variáveis `p` que é inicializada com o valor 1000
e `q` com o valor 20000, ambas do tipo `i64`. A variável `r` 
é declarado como sendo do tipo `i32` é possui valor 800 
durante a inicialização. O ponto e vírgula ";" encerra as 
declaração de variaveis de um tipo de dados.

Para testar o compilador, execute:

```
> flex types.l
> bison -d --debug --verbose types.y
> .\a.exe main.xyz
```

A saída consistirá no percurso realizado pelo analisador 
sintático no arquivo `main.xyz`, verificando cada _token_ e 
reduzindo a pilha se uma regra é satisfeita. Se o compilador
parar a execução no primeiro não-terminal `block` que é reduzido a 
`program` (início do programa) e retorna `0` é sinal de qua a sintaxe 
está correta. **Não há nenhuma ação semântica associada à regras**.
O arquivo [type_main.log](https://raw.githubusercontent.com/prof-holanda/compiladores/main/yacc/07-types/types_main.log) mostra um exemplo de saída 
para os comandos acima.

---

