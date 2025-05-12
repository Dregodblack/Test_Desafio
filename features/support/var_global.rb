########################################################################################################################################################
# Autor: Andre Luis
# Decrição: Esse arquivo serve como um mapeamento dos elementos da pagina web, permitindo usa-los de forma global

# - Obs: Por se tratar de uma Estrutura usando apenas variáveis, Tudo são constantes e precisam ser escritas em MAIÚSCULO por padrão do Ruby
# - Obs: Estruturados como array entre colchetes [] primeiro item é o tipo, o segundo é o seletor
# ├── Como definir ->> SUA_VARIAVEL = [:id, 'element_web'] para os demais é só trocar o tipo: (:xpath,)(:css,)(:class,)
# └── Como usar -->> validar_elemento(*SUA_VARIAVEL)  o "*" explode o array em argumentos separados para o find
########################################################################################################################################################

module GlobalElements
    # Obs: Variaveis separadas por tela:

    # Tela de Login:
    LOGO_LOGIN = [:css, 'img[alt="company-branding"]']
    CAMPO_USERNAME_LOGIN = [:xpath, '//div[@id="app"]//input[@name="username"]']
    CAMPO_PASSWORD_LOGIN = [:xpath, '//div[@id="app"]//input[@name="password"]']
    BOTAO_LOGIN = [:xpath, '//div[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button']
    ALERT_ERRO_LOGIN = [:xpath, '//div[@id="app"]//p[@class="oxd-text oxd-text--p oxd-alert-content-text"]']


    # Tela inicial do usuario
    USER_LOGADO = [:xpath, '//div[@id="app"]//p[@class="oxd-userdropdown-name"]']
    BOTAO_OPCOES_DE_USER = [:xpath, '//div[@id="app"]//i[@class="oxd-icon bi-caret-down-fill oxd-userdropdown-icon"]']
    BOTAO_LOGOUT = [:xpath, '//div[@id="app"]//li[4]//a[@class="oxd-userdropdown-link"]']


    # Tela inicial de gerenciamento de funcionario:
    ELEMENTO_PIM = [:xpath, '//div[@id="app"]//li[2]//a[@class="oxd-main-menu-item"]']
    BOTAO_ADDC_FUNC = [:xpath, '//div[@id="app"]//button[@class="oxd-button oxd-button--medium oxd-button--secondary"]']
    CAMPO_PESQUISA_NOME = [:xpath, '//div[@id="app"]//form/div[1]/div/div[1]//input[@placeholder]']
    CAMPO_PESQUISA_ID = [:xpath, '//div[@id="app"]//form/div[1]/div/div[2]//input[@class]']
    BOTAO_DE_BUSCA = [:xpath, '//div[@id="app"]//button[@type="submit"]']
    AREA_DE_REGISTRO_DE_BUSCA = [:xpath, '//div[@id="app"]//div/span[@class="oxd-text oxd-text--span"]']
    BOTAO_DE_EDITAR_FUNC = [:xpath, '//div[@id="app"]//div[1]/div/div[9]/div/button[1]']
    BOTAO_DE_EXCLUIR_FUNC = [:xpath, '//div[@id="app"]//div[1]/div/div[9]/div/button[2]']
    BOTAO_CONFIRMACAO_DELETE_FUNC = [:xpath, '//div[@id="app"]//div[3]/button[2][@type="button"]']


    # Tela de cadastro de funcionario:
    IMG_USER = [:xpath, '//div[@id="app"]//img[@class="employee-image"]']
    CAMPO_PRIMEIRO_NOME = [:xpath, '//div[@id="app"]//input[@name="firstName"]']
    CAMPO_NOME_DO_MEIO = [:xpath, '//div[@id="app"]//input[@name="middleName"]']
    CAMPO_SOBRENOME = [:xpath, '//div[@id="app"]//input[@name="lastName"]']
    CAMPO_ID_FUNCIONARIO = [:xpath, '//div[@id="app"]/div[1]/div[2]/div[2]//div[1]/div[2]/div[1]/div[2]//div[2]/input']     #instavel
    SELECT_ATIVAR_DETALHES = [:xpath, '//div[@id="app"]//div[@class="oxd-switch-wrapper"]']
    CAMPO_NOME_DO_USER = [:xpath, '//div[@id="app"]//div[3]//input[@class="oxd-input oxd-input--active"]']
    CAMPO_SENHA_CADASTRO = [:xpath, '//div[@id="app"]//div[2]/div[4]/div/div[1]//input[@type="password"]']
    CAMPO_CONFIRM_SENHA_CADASTRO = [:xpath, '//div[@id="app"]//div[2]/div[4]/div/div[2]//input[@type="password"]']
    BOTAO_SALVAR_CADASTRO = [:xpath, '//div[@id="app"]//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]']

    
    # Tela de edição de funcionario:
    CAMPO_ALTERACAO_DE_NOME = [:xpath, '//div[@id="app"]//form/div[1]//div[2]/div/div[2]/input[@name="firstName"]']
    BOTAO_SALVAR_EDICAO = [:xpath, '//div[@id="app"]//form/div[4]//button[@type="submit"]']

end

World(GlobalElements)