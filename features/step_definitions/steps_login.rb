##################################################################################################################################
# Autor: Andre Luis
# Decrição:  Metodos para a interação com a Suite principal
##################################################################################################################################

# Login invalido
Entao('valido que a mensagem {string} de erro é apresentada com sucesso!') do |mensagem|
  pagina.funcao_Login.validar_Login_invalido(mensagem)
end

# Login valido
Dado('que esteja na tela inicial') do
  pagina.funcao_Login.validacao_page
end

Quando('realizo o login com usuario {string} e senha {string}') do |usuario, senha|
  pagina.funcao_Login.efetuar_login(usuario, senha)
end

Entao('valido que o login foi realizado com sucesso!') do
  pagina.funcao_Login.validar_Login
end

# logout
Entao('realizo o logout do usuario') do
  pagina.funcao_Login.validar_Logout
end