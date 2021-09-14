# Compiladores (aka flex+bison)

## Material Didático

- Slides sobre [`flex`](https://drive.google.com/file/d/1kWByXIBed08TE1apS7LiLO39NRBF4xKS/view?usp=sharing);
- [Exercícios](https://github.com/prof-holanda/compiladores/blob/main/exercicios.md) sobre análise léxica usando `flex`.

## Setup

### Windows

1. Abra o PowerShell como **Administrador** e execute o comando a seguir
para permitir que _scripts_ sem assinatura digital sejam executados:

```
Set-ExecutionPolicy RemoteSigned
```

2. Execute o comando a seguir no PowerShell para instalar os programas
a serem usados:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/prof-holanda/compiladores/main/setup/win.ps1'))
```

- [Vídeo no Youtube demonstrando o processo de setup do Windows passo a passo](https://youtu.be/Shp0N-T17bA).

### Linux

Execute os seguintes comandos no `bash`:

```
$ cd /tmp
$ wget https://raw.githubusercontent.com/prof-holanda/compiladores/main/setup/lnx.sh
$ bash lnx.sh
```

O script foi testado no Debian, talvez algumas alterações tenham que ser feitas para o 
Ubuntu.

## Fluxo de Compilação

### Windows

Abra o PowerShell e entre no diretório que contém os arquivos com os códigos e execute:

```
PS ...\compiladores\src> win_flex -o f01.yy.c f01.l

PS ...\compiladores\src> gcc -o f01.exe f01.yy.c

PS ...\compiladores\src> .\f01.exe arquivo_de_entrada.txt
```

### Linux

Abra o `bash` e entre no diretório que contém os arquivos com os códigos e execute:

```
.../compiladores/src$ flex -o f01.yy.c f01.l

.../compiladores/src$ gcc -o f01 f01.yy.c

.../compiladores/src$ ./f01 arquivo_de_entrada.txt
```

# Dicas e Recursos

- [Guia de instalação do Subsistema Windows para Linux para Windows 10](https://docs.microsoft.com/pt-br/windows/wsl/install-win10).
- Como instalar o [Windows Terminal](https://www.microsoft.com/pt-br/p/windows-terminal/9n0dx20hk701) para executar comandos `Unix`-like com mais facilidade.
-  Brian Kernighan, [UNIX: A History and a Memoir](https://www.amazon.com.br/UNIX-History-English-Brian-Kernighan-ebook/dp/B07ZQHX3R1): 
Livro que narra a história do desenvolvimento do Sistema Operacional `Unix` por quem participou ativamente
do processo. Neste livro é descrito com detalhes o surgimento do `lex` e `yacc`.

---
[Adriano J. Holanda](https://ajholanda.github.io/)
