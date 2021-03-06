# Compiladores (aka `lex` &#8594; `flex` + `yacc` &#8594; `bison`)

## Recursos Didáticos

- [lex](lex/)
- [yacc](yacc/)
- [Exercícios](https://github.com/prof-holanda/compiladores/blob/main/exercicios.md) sobre análise léxica usando `lex` e `yacc`. [[pdf](https://drive.google.com/file/d/1WCkVJgJfpCTTtohn12ooS58K4Qxvatq0/view?usp=sharing)]

# Projeto

Projeto a ser desenvolvido e entregue para aprendizado 
dos temas abordados:

- [Análisador léxico e sintático com tabela de símbolos para a linguagem XYZ](https://drive.google.com/file/d/1ggvnsJSTHWxt0AQykWItaqApOkYGV71i/view?usp=sharing).
[`Atualizado em 02/12/2021`]

## Debug

Para depurar o fluxo de análise sintática, realize o seguintes 
procedimentos:

- Adicione a atribuição `int yydebug = 1;` na seção de declaração 
do arquivo `yacc` `xyz.y`;
- Execute o `bison` com a _flag_ `--debug` e `--verbose`, 
compile o arquivo gerado `xyz.tab.c` e teste em um arquivo
contendo o código na linguagem `XYZ`:

```
bison -d --debug --verbose xyz.y
gcc xyz.tab.c -o xyz.exe
./xyz.exe arquivo.xyz
```

Qualquer dúvida, por favor abra uma [_issue_](https://github.com/prof-holanda/compiladores/issues) 
ou envie um email. 

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
$ git clone https://github.com/prof-holanda/compiladores.git
$ cd compiladores/setup
$ bash lnx.sh
```

O script foi testado no Debian/Ubuntu, talvez algumas alterações tenham que ser feitas para 
outras distribuições.

# Dicas

- [Guia de instalação do Subsistema Windows para Linux para Windows 10](https://docs.microsoft.com/pt-br/windows/wsl/install-win10).
- Como instalar o [Windows Terminal](https://www.microsoft.com/pt-br/p/windows-terminal/9n0dx20hk701) para executar comandos `Unix`-like com mais facilidade.
-  Brian Kernighan, [UNIX: A History and a Memoir](https://www.amazon.com.br/UNIX-History-English-Brian-Kernighan-ebook/dp/B07ZQHX3R1): 
Livro que narra a história do desenvolvimento do Sistema Operacional `Unix` por quem participou ativamente
do processo. Neste livro é descrito com detalhes o surgimento do `lex` e `yacc`.
- [Chocolatey](https://chocolatey.org/): gerenciador de instalação de programas para Windows.
- [VS Code](https://code.visualstudio.com/download): editor usado nas demonstrações e aulas.
- [Mingw](https://www.mingw-w64.org/): projeto contendo o `gcc` para Windows. Porém, qualquer compilador C pode ser usado, dentre eles: [`tcc`](https://bellard.org/tcc/) e
[`clang`](https://clang.llvm.org/).
- [winflexbison](https://github.com/lexxmark/winflexbison/releases): projeto de portabilidade do `flex` e `bison` para Windows.

---
[Adriano J. Holanda](https://ajholanda.github.io/)
