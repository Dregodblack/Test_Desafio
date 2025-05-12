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
@funcionalidade_navegacao
Funcionalidade: Realizar navegação de usuario
  Como usuario do sistema,
  Quero explorar as funcionalidades,
  Para garantir uma boa experiência de uso.

# A seção "Contexto" evita repetição dos passos, e define pré-requisitos para todos os cenários
Contexto:
    Dado que esteja na tela inicial
    # Quando realizo o login com usuario "Admin" e senha "admin123"
    # Entao valido que o login foi realizado com sucesso!


# O "Esquema do Cenário" serve para Cenários que testam a mesma funcionalidade com diferentes entradas.
@validar_direcionamentos
Esquema do Cenário: Validar direcionamento para meios de comunicação
    Quando clico no ícone de plataforma <plataforma>
    Entao valido que sou redirecionado para a página da plataforma <plataforma>
    Exemplos:
    | plataforma |
    | LinkedIn   |
    | Facebook   |
    | Twitter    |
    | YouTube    |


@alterar_senha_do_usuario
Cenário: Alterar senha do usuario
    Quando realizo o login com usuario "Admin" e senha "admin123"
    E valido que o login foi realizado com sucesso!
    E realizo a alteração de senha do usuario
    Entao valido que a nova senha foi salva com sucesso!
    Exemplos:
    |senha_atual|senha_nova|
    |"LinkedIn" |"LinkedIn"|


@alterar_dados_do_usuario
Cenário: Alterar dados do usuario
    Quando realizo o login com usuario "Admin" e senha "admin123"
    E valido que o login foi realizado com sucesso!
    E realizo a alteração dos dados do usuario
    Entao valido que os novos dados foram salvo com sucesso!


@realizar_busca_por_funcionalidade
Cenário: Validar busca de funcionalidade
    Quando realizo o login com usuario "Admin" e senha "admin123"
    E valido que o login foi realizado com sucesso!
    E realizo a busca por uma funcionalidade
    Entao valido que a funcionalidade foi apresentada com sucesso!


@recrutamento_addc_candidato
Cenário: Adicionar um candidato para recrutamento
    Quando realizo o login com usuario "Admin" e senha "admin123"
    E valido que o login foi realizado com sucesso!
    E cadastro um novo candidato para area de recrutamento
    Entao valido que o candidato foi cadastrado com sucesso!


@recrutamento_addc_vaga
Cenário: Adicionar uma vaga para recrutamento
    Quando realizo o login com usuario "Admin" e senha "admin123"
    E valido que o login foi realizado com sucesso!
    E cadastro uma nova vaga para area de recrutamento
    Entao valido que a vaga foi cadastrada com sucesso!