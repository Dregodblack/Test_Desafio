##################################################################################################################################
# Autor: Andre Luis
# Decrição:  Metodos para a interação com a Suite principal
##################################################################################################################################

# Pré-requisito estar na tela inicial de gerenciamento de funcionario
E('sou direcionado para a tela de gerenciamento de funcionario') do
    pagina.funcao_Cadastro.validar_tela_de_gerenciamento
end


# Cadastrar novo funcionario
Quando('realizo o cadastro de um novo funcionario') do 
    pagina.funcao_Cadastro.efetuar_cadastro
end

Entao('valido que o funcionario é cadastrado com sucesso!') do
    pagina.funcao_Cadastro.validar_cadastro
end


# Busca por funcionario
Quando('realizo a busca por um funcionario {string} e {string} existente') do |funcionario, id|
    pagina.funcao_Cadastro.efetuar_busca(funcionario, id)
end

Entao('valido que o funcionario {string} e {string} é apresentado com sucesso!') do |funcionario, id|
    pagina.funcao_Cadastro.validar_busca(funcionario, id)
end


# Alteração de dados do funcionario
E('altero os dados de um funcionario existente adicionando um novo dado {string}') do |novos_dados|
    pagina.funcao_Cadastro.efetuar_alteracao_de_dados(novos_dados)
end

Entao('valido que os dados {string} foram atualizados com sucesso!') do |novos_dados|
    pagina.funcao_Cadastro.validar_alteracao_de_dados(novos_dados)
end


# Exclusão de dados do funcionario
E('realizo a exclusao de um funcionario existente') do
    pagina.funcao_Cadastro.efetuar_exclusao
end

Entao('valido que o funcionario foi excluido com sucesso!') do
    pagina.funcao_Cadastro.validar_exclusao
end