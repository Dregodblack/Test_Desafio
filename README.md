<!--
##############################################################################################################
- Autor: Andre Luis
- Decrição: Esse arquivo serve centralizar todas as informações e requisitos importantes desse projeto
##############################################################################################################
-->

<h3> Para você Conseguir rodar essa automação é preciso seguir esses passos em seu Sistema Operacional: </h3> 

<h4>1. Oque foi feito da Configuração do ambiente?</h4>

- Instale a versão mais recente do Ruby.
- Gerenciador de Pacotes (Bundler): Após instalar o Ruby, execute "gem install bundler" para gerenciar dependências do projeto.
- biblioteca (cucumber): "gem install cucumber" Ele baixa e instala a gem, ou verifica se há atualizações e pode instalar a versão mais recente.
- Framework de Testes: Cucumber para testes BDD (Behavior-Driven Development).
- Selenium/WebDriver (teste de interface web).

<h4>2. Oque foi feito na Crição da estrutura do projeto </h4>

- execute "bundle init" no terminal
- edite  o "Gemfile" criado e adicione as dependências:

        source 'https://rubygems.org'
        
        gem 'rspec'                             # Para apoiar na sintaxe das escritas dos testes
        gem 'selenium-webdriver'                # Caso seja um teste web
        gem 'capybara'                          # Caso use para interações web
        gem 'cucumber'                          # Para testes em BDD
        gem 'faker'                             # Gera dados falsos ou aleatórios (ex: nome, e-mail, CPF) e etc...
        gem 'cpf_faker'                         # Gera CPF´s no formato BR (ex: 000.000.000-00)
        gem 'pry'                               # Para depuração durante a execução do código
        gem 'cucumber-html-formatter'           # Para gerar relatórios em HTML
        gem 'webdrivers'                        # baixa a versão atual automaticamente do chromedriver
        gem 'cucumber-screenshot'               # Gera screenshot de tela que apoia no relatório HTML


- execute "bundle install" no terminal
        Obs: sempre que adicionar uma nova "gem" no arquivo "Gemfile" execute -->> bundle install no terminal

- execute "cucumber --init" no terminal, que inicializa uma nova estrutura de projeto Cucumber: (exemplo)

        [features]                              # Pasta criada
        - step_definitions                      # Aqui ficam os arquivos Ruby com as definições dos passos dos testes
        - support/                              # Aqui contém arquivos de configuração, como Ambiente, drivers e hooks 

- posteriormente, crie essas sub-pastas dentro da pasta "features":

        - class                                 # Aqui ficam os arquivos com classes criadas para uso da automação
        - spec                                  # Aqui ficam os arquivos de cenário de teste (em Gherkin)
        - report                                # Aqui contém arquivos de evd referente aos testes executados

- Exemplo da estrutura pronta:

        [features]
        - class 
        - spec 
        - step_definitions    
        - support         
        - report


- Arquivos & pastas adicionais para a estrutura:

        [Document]                              # contem arquivos do tipo PDF, que solicitam o desafio
        - cucumber.yml                          # personalizar formas de execução do Cucumber
        - README.md                             # Documentação com instruções

## <!--############################################################################################ -->

<h4> Teste executado nessa URL: </h4>

        -> https://opensource-demo.orangehrmlive.com/

        Obs: Ao tentar realizar os testes nos sites abaixo conforme solicitado na Documentação, não foi possível acessar a pagina web pois retorna um erro 404, informando que a URL solicitada não corresponde a nenhum recurso disponivel no servidor (Evd na pasta de "Document")
        Então para não perder tempo, segui com site similar para testes automatizados conforme mencionado na Documentação
        X https://advantageonlineshopping.com/#/
        X https://advantageonlineshopping.com/catalog/api/v1/products

<h4> Como executar um teste? </h4>

        Para a execução dos cenários de testes, eles foram separados por "tags" de um modo organizado para facilitar na execução seletiva dos cenários, e para executar um cenério de teste é preciso que abra um terminal dentro do projeto e...

                - Para executar um teste em especifico: 
                        cucumber --tags "@cenario_desejado"
                Obs: executara o teste de forma individual

                - Para executar alguns testes de uma funcionalidade especifica: 
                        cucumber --tags "@funcionalidade_desejada"
                Obs: executara apenas os testes dentro de uma determinada feature, a tag de execução se encontra próximo a "funcionalidade" descrita do arquivo
        
                - Para executar um regressivo: 
                        cucumber --tags "@regressivo"
                Obs: executara todos os cenários de testes criados nesse projeto!

        Obs: Se encontra "binding.pry", significa que precisei investigar comportamentos inesperados durante os testes executados

<h4> Instalação da Linguagem de programação Ruby: </h4>

        - Versão utilizada(ruby 3.4.2) // Site (https://rubyinstaller.org/downloads/)

<h4> Instalação do Chrome & chromedriver: </h4>

        Versão Chrome 135.0.7049.115 (Versão oficial) 64 bits / windowns

        - Versão Chrome for Testing (135.0.7049.114) win64
        - Versão chromedriver for Testing (135.0.7049.114) win64

        Chrome and chromedriver for Testing  -->> (https://googlechromelabs.github.io/chrome-for-testing/#stable)
        Obs: Validar a versão oficial do seu chrome e buscar a mais próxima para não ter conflitos no teste, e baixar a versão de acordo com o seu sistema operacional!!

        Depois da instalação, lembre-se de adicionar ambos na mesma pasta e configurar o caminho desta pasta na variavel de ambiente do sistema "path", depois disso voce adiciona novamente o caminho dessa pasta no arquivo "hooks.rb" linha 16
        E certifique-se de que o novo chrome e chromedrive estão sendo possíveis de abrir de forma manual e via CMD, se não seu teste vai dar Erro assim: (Selenium::WebDriver::Error::NoSuchDriverError)

<h4> Extensões Necessárias do VS_Code: </h4> 

        - Ruby
        - vscode-icons [opcional]
        - GitLens
        - Snippets and Syntax Highlight for Gherkin (Cucumber)
        - Cucumber (Gherkin) Full Support
        - Portuguese (Brazil) Language Pack for Visual Studio Code. [opcional]

        - DotENV = Para ajudar a reconhecer e realçar variáveis de ambiente em arquivos do tipo ".env"

<h4> Bibliotecas importadas: </h4> 

        - rspec:                       - framework de testes (usado nos bastidores pelo Capybara)
        - rspec/expectations:          - permite escrever asserções como expect(x).to eq(y)
        - selenium-webdriver:          - permite o controle de navegadores reais (Chrome, Firefox etc)
        - webdrivers:                  - baixa a versão automaticamente do chromedriver com base no seu navegador
        - capybara:                    - biblioteca de automação que simula a interação com a interface web
        - capybara/cucumber:           - integra o Capybara com o Cucumber
        - capybara/rspec:              - traz matchers do RSpec pro Capybara (have_content, have_selector, etc.)
        - capybara/dsl:                - inclui o módulo Capybara::DSL, onde esta os métodos do Capybara
        - cucumber:                    - biblioteca de automação que apoia nos testes em BDD
        - faker:                       - gera dados falsos ou aleatórios (ex: nome, e-mail, CPF) e etc...
        - cpf_faker:                   - Gera CPF´s no formato BR (ex: 000.000.000-00)
        - pry:                         - ferramenta de depuração (debugger de Ruby, tipo um "breakpoint")
        - cucumber-html-formatter:     - usada para gerar relatórios HTML
        - cucumber-screenshot:         - Gera screenshots de tela que apoiam no relatório HTML da execução
        - fileutils:                   - serve para manipular arquivos e diretórios (Cria a pastas, Copia arquivo, Remove arquivo) e etc...

<h4> Bibliotecas instaladas: </h4> 

        - cucumber: biblioteca de automação, usada para testes em BDD
          Execute no terminal: gem install cucumber
          Obs: Para validar sua existencia, execute no terminal: "gem list cucumber" nisso deve ser apresentado uma lista

        - pry: biblioteca de desenvolvimento, usada para investigar bugs ou comportamentos inesperados
          Execute no terminal: gem install pry