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
@funcionalidade_gerenciamento_de_func
Funcionalidade: Realizar gerenciamento dos Funcionários
  Como administrador do sistema,
  Quero gerenciar os dados dos funcionários,
  Para garantir que as informações estejam atualizadas.

# A seção "Contexto" evita repetição dos passos, e define pré-requisitos para todos os cenários
Contexto:
    Dado que esteja na tela inicial
    Quando realizo o login com usuario "Admin" e senha "admin123"
    Entao valido que o login foi realizado com sucesso!
    E sou direcionado para a tela de gerenciamento de funcionario


@cadastrar_novo_funcionario
Cenário: Cadastrar novo funcionario
    Quando realizo o cadastro de um novo funcionario
    Entao valido que o funcionario é cadastrado com sucesso!
#  Exemplos: Aqui esta realizando o cadastro usando dados falsos ou aleatorios para evitar a escrita manual


@realizar_busca_por_funcionario
Cenário: Validar busca de um funcionario
    Quando realizo a busca por um funcionario <funcionario> e <id> existente
    Entao valido que o funcionario <funcionario> e <id> é apresentado com sucesso!
    Exemplos:
    |funcionario|id     |
    |"Admin"    |"0011" |
# Obs: Se a busca não achar os parametros é porque o proprio sistema apagou do banco de dados, recomendável que pesquise antes manualmente para validar que os dados da automação existem, se não, pesquise por novos dados
# Obs: Aqui também existe duas opções para contornar, pesquisa via banco de dados, ou geração de novos dados antes da sua execução 


@realizar_edicao_de_funcionario
Cenário: Editar dados de um funcionario
    Quando realizo a busca por um funcionario <funcionario> e <id> existente
    E valido que o funcionario <funcionario> e <id> é apresentado com sucesso!
    E altero os dados de um funcionario existente adicionando um novo dado <novos_dados>
    Entao valido que os dados <novos_dados> foram atualizados com sucesso!
    Exemplos:
    |funcionario|id     |novos_dados|
    |"Admin"    |"0011" |"TesteQA"  |
# Obs: Se a busca não achar os parametros é porque o proprio sistema apagou do banco de dados, recomendável que pesquise antes manualmente para validar que os dados da automação existem, se não, pesquise por novos dados
# Obs: Aqui também existe duas opções para contornar, pesquisa via banco de dados, ou geração de novos dados antes da sua execução 


@excluir_funcionario_existente
Cenário: Excluir um funcionario
    Quando realizo a busca por um funcionario <funcionario> e <id> existente
    E valido que o funcionario <funcionario> e <id> é apresentado com sucesso!
    E realizo a exclusao de um funcionario existente
    Entao valido que o funcionario foi excluido com sucesso!
    Exemplos:
    |funcionario|id     |
    |"Admin"    |"0011" |
# Obs: Se a busca não achar os parametros é porque o proprio sistema apagou do banco de dados, recomendável que pesquise antes manualmente para validar que os dados da automação existem, se não, pesquise por novos dados
# Obs: Aqui também existe duas opções para contornar, pesquisa via banco de dados, ou geração de novos dados antes da sua execução 