##################################################################################################################################
# Autor: Andre Luis
# Decrição: O "env.rb" serve para configurar o ambiente de testes antes de qualquer execução. 

# O que contem nesse arquivo:
#   ├── Requisições de bibliotecas (ex: require 'capybara')
#   ├── Configurações globais (como tempo de espera padrão, ou definição de ações antes ou depois de cada cenário)
#   ├── Inicializações que valem para todos os testes
#   ├── Configurações do Capybara, drivers de browser e timeout
#   └── Variáveis de ambiente

##################################################################################################################################

# Requisições de Bibliotecas
require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'capybara/dsl'
require 'cucumber'
require 'rspec'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'pry'
require 'webdrivers'
require 'fileutils'
# require 'faker'

# Carrega todos os arquivos Ruby dentro da pasta support/ e subpastas
Dir.glob(File.join(File.dirname(__FILE__), '**', '*.rb')).each { |file| require file }
# Dir[File.join(File.dirname(__FILE__), '**', '*.rb')].sort.each { |file| require file }


# Aqui está incluindo o (Capybara::DSL) e (Capybara::RSpecMatchers) que  permite usar comandos e matchers 
RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
end

# Aqui está registrando o driver como Selenium, o browser como chrome
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Aqui define qual driver deve se usar como padrão nos testes, também define o endereço da URL base, 
# ou seja, a aplicação que será testada e o tempo de espera do Selenium por "15" segundos
Capybara.configure do |config|
  config.default_driver = :chrome
  config.app_host = 'https://opensource-demo.orangehrmlive.com'
  config.default_max_wait_time = 15
end

# # variáveis globais 

# $nome_completo_faker = Faker::Name.name.capitalize
# $primeiro_nome_faker = Faker::Name.first_name.capitalize
# $nome_do_meio_faker = Faker::Name.middle_name.capitalize
# $sobrenome_faker = Faker::Name.last_name.capitalize
# $cpf_faker = Faker::CPF.pretty
# $data_atual = Time.now.strftime('%d/%m/%Y')
# $valor_id = Faker::Number.number(digits: 5)
# $usuario_faker = "#{Faker::Name.first_name.downcase}#{Faker::Number.number(digits: 4)}"
# $senha_faker = "@#{Faker::Name.first_name.capitalize}#{Faker::Number.number(digits: 4)}"