# Análise léxica usando `lex` &#8594; `flex`

# Material didático

- Slides sobre [`flex`](https://drive.google.com/file/d/1kWByXIBed08TE1apS7LiLO39NRBF4xKS/view?usp=sharing);
- [Exercícios](https://github.com/prof-holanda/compiladores/blob/main/exercicios.md) sobre análise léxica usando `flex`. [[pdf](https://drive.google.com/file/d/1hOAhKKeneLDFGcZztwBoFxHkGcrHN2Ec/view?usp=sharing)]

## Fluxo de Compilação

### Windows

Abra o PowerShell e entre no diretório que contém os arquivos com os códigos e execute:

```
PS ...\compiladores\lex> flex -o f01.yy.c f01.l

PS ...\compiladores\lex> gcc -o f01.exe f01.yy.c

PS ...\compiladores\lex> .\f01.exe arquivo_de_entrada.txt
```

### Linux

Abra o `bash` e entre no diretório que contém os arquivos com os códigos e execute:

```
.../compiladores/src$ flex -o f01.yy.c f01.l

.../compiladores/src$ gcc -o f01 f01.yy.c

.../compiladores/src$ ./f01 arquivo_de_entrada.txt
```

---
[Adriano J. Holanda](https://ajholanda.github.io/)