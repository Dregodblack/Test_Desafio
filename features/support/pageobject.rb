##################################################################################################################################
# Autor: Andre Luis
# Decrição: Esse arquivo centraliza e configura todas as classes, e  serve como ponto de referência para importá-las
##################################################################################################################################

# Essa "class BasePage" faz parte da estrutura orientada a objetos e evita repetir código em todas as páginas
# ├── class BasePage =>> É uma base para todas as outras páginas do sistema, ou seja, todas as outras classes podem herdar
# └── include Capybara::DSL =>>  Permite usar os comandos do Capybara dentro da sua classe

Dir.glob(File.join(File.dirname(__FILE__), '**', '*.rb')).each { |file| require file }

class BasePage
  include Capybara::DSL             # Para utilizar elementos do Capybara
  include Helper                    # Para utilizar funções configuradas
  include GlobalElements            # Para utilizar variaveis da pagina web
end


# Carrega as classes de dentro da pasta class herdando da "class BasePage"
class PageObjects
        
  def funcao_Login
    LoginPage.new
  end

  def funcao_Cadastro
    CadastroPage.new
  end

  def funcao_Navegacao
    NavegacaoPage.new
  end

end


# Permite a instância de PageObjects disponível pra você usar no código dos steps de forma simples e organizada
module PageHelper
  def pagina
    @pagina ||= PageObjects.new
  end
end

World(PageHelper)