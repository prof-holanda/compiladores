# Compiladores (aka flex+bison)

## Slides

- [`flex`](https://drive.google.com/file/d/1kWByXIBed08TE1apS7LiLO39NRBF4xKS/view?usp=sharing)

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

## Fluxo de compilação

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

---
[Adriano J. Holanda](https://ajholanda.github.io/)
