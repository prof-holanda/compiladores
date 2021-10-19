# Análise sintática usando `yacc` &#8594; `bison`

## Material didático

- Slides sobre [`yacc` &#8594; `bison`]();
- [Exercícios]() sobre análise léxica usando `flex`. [[pdf]()]

## Fluxo de Compilação

### Windows

Abra o PowerShell e entre no diretório que contém os arquivos com os códigos e execute:

```
PS ...\compiladores\yacc\01-calc> flex calc.l

PS ...\compiladores\yacc\01-calc> bison -d calc.y

PS ...\compiladores\yacc\01-calc> gcc -o calc.exe lex.yy.c calc.tab.c

PS ...\compiladores\yacc\01-calc> .\calc.exe
```

### Linux

Abra o `bash` e entre no diretório que contém os arquivos com os códigos e execute:

```
.../compiladores/yacc/01-calc$ flex calc.l

.../compiladores/yacc/01-calc$ bison -d calc.y

.../compiladores/yacc/01-calc$ gcc -o calc lex.yy.c calc.tab.c

.../compiladores/yacc/01-calc$ ./calc
```

---
[Adriano J. Holanda](https://ajholanda.github.io/)