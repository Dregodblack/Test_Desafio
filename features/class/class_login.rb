##################################################################################################################################
# Autor: Andre Luis
# Decrição: Metodos para a interação com o navegador
##################################################################################################################################

class LoginPage < BasePage

  def validacao_page
    validar_elemento(*LOGO_LOGIN)
  end

  def efetuar_login(usuario, senha)
    preencher_texto(*CAMPO_USERNAME_LOGIN, usuario)
    preencher_texto(*CAMPO_PASSWORD_LOGIN, senha)
    clicar_no_elemento(*BOTAO_LOGIN)
  end

  def validar_Login
    validar_elemento(*USER_LOGADO)
  end

  def validar_Login_invalido(mensagem)
    validar_elemento(*ALERT_ERRO_LOGIN)
    validar_texto(mensagem)
  end

  def validar_Logout
    clicar_no_elemento(*BOTAO_OPCOES_DE_USER)
    clicar_no_elemento(*BOTAO_LOGOUT)
    validar_elemento(*LOGO_LOGIN)
  end

end