##################################################################################################################################
# Autor: Andre Luis 
# Decrição: Aqui esta presente a escrita dos cenários de testes em BDD, seguindo as boas práticas do Gherkin e do Cucumber

# - #language: pt ->>  informa ao Cucumber que seu arquivo está escrito em português
# - encoding: utf-8 ->> É importante pra garantir que caracteres especiais sejam interpretados

# Obs: Funcionalidade: Serve para fornecer uma visão geral do que está sendo testado
#          ├── Como [User ou Adm]
#          ├── Quero [Realizar uma ação]
#          └── Para [Benefício ou Validação]
##################################################################################################################################

# language: pt
# encoding: utf-8

@regressivo
@funcionalidade_login
Funcionalidade: Realizar autenticações dos usuarios
  Como usuario do sistema,
  Quero me autenticar no sistema,
  Para garantir um acesso seguro dos usuarios.

# A seção "Contexto" evita repetição dos passos, e define pré-requisitos para todos os cenários
Contexto:
    Dado que esteja na tela inicial


@realizar_login_fail
Cenário: validar login com dados invalidos
    Quando realizo o login com usuario <usuario> e senha <senha>
    Entao valido que a mensagem <mensagem> de erro é apresentada com sucesso!
    Exemplos:
    |usuario|senha      |mensagem             |
    |"Test" |"123456789"|"Invalid credentials"|


@realizar_login_pass
Cenário: validar login com sucesso
    Quando realizo o login com usuario <usuario> e senha <senha>
    Entao valido que o login foi realizado com sucesso!
    Exemplos:
    |usuario|senha     |
    |"Admin"|"admin123"|


@realizar_logout_do_usuario
Cenário: validar logout do usuario pós login
    Quando realizo o login com usuario <usuario> e senha <senha>
    E valido que o login foi realizado com sucesso!
    Entao realizo o logout do usuario
    Exemplos:
    |usuario|senha     |
    |"Admin"|"admin123"|