##################################################################################################################################
# Autor: Andre Luis
# Decrição: Esse arquivo centraliza todas as funções dentro de um modulo "Helper", permitindo usa-los de forma global
##################################################################################################################################

# Garante que as constantes "Faker" e "cpf_faker" esteja disponível no escopo do arquivo
require 'faker' 
require 'cpf_faker'

module Helper
    include Capybara::DSL

    def esperar
        sleep(3)
    end
    
    def clicar_no_elemento(tipo, elemento)
        validar_elemento(tipo, elemento).click
    end

    def validar_texto(texto)
        if page.has_text?(texto)
            captura_de_tela
        else
            captura_de_tela
            raise "O texto: '#{texto}' não foi encontrado conforme esperado!"
        end
    end
      
    def validar_elemento(tipo, elemento)
        esperar
        begin
            item = find(tipo, elemento, visible: true)
            scroll_ate_elemento(tipo, elemento)
            captura_de_tela
            item  
        rescue Capybara::ElementNotFound
            raise "Elemento não encontrado na tela: #{elemento}"
        end
    end


    def preencher_texto(tipo, elemento, texto)
        campo = clicar_no_elemento(tipo, elemento).send_keys([:control, 'a'], :backspace)  # limpando caracteres dentro do campo selecionado!

        if texto == "nome_completo_Faker"
            campo.send_keys(Faker::Name.name.capitalize)

        elsif texto == "primeiro_nome_Faker"
            campo.send_keys(Faker::Name.first_name.capitalize)

        elsif texto == "nome_do_meio_Faker"
            campo.send_keys(Faker::Name.middle_name.capitalize)

        elsif texto == "sobrenome_Faker"
            campo.send_keys(Faker::Name.last_name.capitalize)

        elsif texto == "cpf_Faker"
            campo.send_keys(Faker::CPF.pretty)

        elsif texto == 'data_atual'
            campo.send_keys(Time.now.strftime('%d/%m/%Y'))

        elsif texto == 'valor_ID'
            campo.send_keys(Faker::Number.number(digits: 5))

        elsif texto == 'usuario_Faker'
            usuario_name = Faker::Name.first_name.downcase
            usuario_ID = Faker::Number.number(digits: 4)
            usuario_customizado = "#{usuario_name}#{usuario_ID}"
            campo.send_keys(usuario_customizado)

        elsif texto == 'senha_Faker'
            usuario_name = Faker::Name.first_name.capitalize
            usuario_ID = Faker::Number.number(digits: 4)
            senha_customizada = "@#{usuario_name}#{usuario_ID}"
            campo.send_keys(senha_customizada)

        else
            campo.send_keys(texto)
        end
        # campo.send_keys(texto)
        captura_de_tela
    end


    def scroll_ate_elemento(tipo, elemento)
        script = <<-JS
          arguments[0].scrollIntoView({ behavior: 'smooth', block: 'center' });
        JS
        item = find(tipo, elemento, visible: true)
        page.execute_script(script, item.native)
    end

    def recarregar_pagina_web
        page.refresh
        esperar
    end

    def acessar_URL_diferente(link)
        if link.start_with?('http')
            visit(link)                 # Redireciona pra outra URL
            esperar
            captura_de_tela
        else
            visit(link)                 # Serve de complemento da URL_Base já configurada no "app_host"
            esperar
            captura_de_tela
        end
    end

    # Gerador de arquivos screenshots, Define o caminho e nome do arquivo, e Pega a data e hora atual
    def captura_de_tela
        time = Time.now.strftime('Dia_%d-%m-%Y_Hr_%H-%M-%S')
        filename = "report/screenshots/#{$scenario.name.gsub(' ', '_')}_#{time}.png"
        page.save_screenshot(filename)
        filename
        # attach(File.open(filename), 'image/png', 'Screenshot')       
        #  └──> Anexa as capturas de tela no relatório gerado pelo Cucumber

        # Resultado final: CenárioAtual_Dia_10-12-2025_Hr_05-24-55.png
    end

    def debug(tipo, elemento)
        puts "DEBUG: Tentando localizar o elemento => Tipo: #{tipo}, Seletor: #{elemento}"
        begin
            find(tipo, elemento, visible: true)
            puts "DEBUG: Elemento encontrado com sucesso!"
        rescue Capybara::ElementNotFound
            raise "Elemento não encontrado na tela: #{elemento}"
        end
    end
    
end

World(Helper)
          
##############################################################################################################
# Outros:

#  # Ou esperar que algo desapareça:
#  expect(page).to have_no_selector(:css, '.loading')
  
#  # Esperando valores em campos:
#  expect(find(:css, 'input#username').value).to eq('usuario123')
#  expect(page).to have_content('Texto esperado')
#  expect(page).to have_selector(:css, 'h1.titulo')
#  expect(page).to have_xpath("//button[@id='submit']")
#  expect(find(:css, 'h1.titulo')).to have_text('Bem-vindo')