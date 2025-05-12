##################################################################################################################################
# Autor: Andre Luis
# Decrição: O "hooks.rb" permite executar ações antes ou depois dos testes, usando os chamados hooks do Cucumber.

#  ├── Before: roda antes de cada cenário
#  ├── After: roda depois de cada cenário
#  ├── BeforeStep / AfterStep: roda antes/depois de cada passo (step)
#  └── Around: envolve o cenário inteiro (mais avançado)
##################################################################################################################################

Capybara.register_driver :chrome do |app|
	Selenium::WebDriver::Chrome::Service.driver_path = 'C:\\chromedriver\\chromedriver.exe'  
	# Obs: Precisei configurar o caminho do driver manualmente pois estou usando a ultima versão disponivel do chrome, mas se trata de uma versão para testes automatizados
	
	options = Selenium::WebDriver::Chrome::Options.new					# Aqui configuro a automação para a versão estavel do (Chrome for Testing)
	options.binary = 'C:\\chromedriver\\chrome.exe'						# Aponta para o Chrome portátil
	
	# # Desativa os pop-ups do Chrome de "Alerta de Senha"
	# chrome_options.add_preference('credentials_enable_service', false)
	# chrome_options.add_preference('profile.password_manager_enabled', false)

	# flags úteis para teste
	options.add_argument('--no-sandbox')                    			# Evita problemas de permissão (útil em CI ou VMs)
	options.add_argument('--disable-dev-shm-usage')         			# Usa memória do disco ao invés de /dev/shm (evita crashes em Linux)
	options.add_argument('--disable-gpu')                   			# Desativa uso de GPU (útil quando não há suporte gráfico)
	options.add_argument('--disable-popup-blocking')        			# Garante que pop-ups não bloqueiem testes
	options.add_argument('--disable-extensions')            			# Impede carregamento de extensões
	options.add_argument('--ignore-certificate-errors')     			# Ignora erros de HTTPS (útil em ambientes de teste)
	options.add_argument('--log-level=3') 								# Minimiza logs do Chrome
	
	Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Before do |scenario|
	$scenario = scenario												# Variável global que busca o nome do cenário a ser executado!
    Capybara.reset_sessions!											# Reseta a sessão do navegador, Apagando cookies e Limpando o armazenamento local
	visit('/')                                       					# Define que "/"" é a raiz do config.app_host, acessando automaticamente a URL configurada no arquivo "env.rb"
	page.driver.browser.manage.window.maximize      					# Maximiza a aba do navegador que foi aberta na automação
    FileUtils.mkdir_p('report/relatorio')								# Garante que exista uma pasta report, e cria se não existir
	FileUtils.mkdir_p('report/screenshots')	    						# Garante que exista uma pasta report para os prints de tela, e cria se não existir
end

After do
	report = "report/relatorio/"										# Aponta o caminho onde esta sendo salvo os reports
	screenshots = "report/screenshots/"									# Aponta o caminho onde esta sendo salvo os screenshots
	puts "Reports HTML salvos em: #{report}"							# Mensagem informativa no terminal após finalizar execução
	puts "Screenshots salvos em: #{screenshots}"						# Mensagem informativa no terminal após finalizar execução
	
	# filename = captura_de_tela
  	# attach(File.open(filename), 'image/png', 'Screenshot')			# Anexa as capturas de tela no relatório gerado pelo Cucumber
	
	Capybara.current_session.driver.quit								# Ele encerra o processo do navegador Chrome ou qualquer outro browser que você esteja usando.
end



##################################################################################################################################
# Outros

# # Verifica se o cenário falhou ou passou, e Define...
# After do |scenario|
# 	status = scenario.failed? ? 'FAIL' : 'PASS'
#	puts "..."
# 	filename = "report/screenshots/#{status}_#{scenario.name.gsub(' ', '_')}_#{time}.png"
# 	screenshots = "report/screenshots/"
# 	@driver.save_screenshot(filename)
# 	puts "Screenshots salvos em: #{screenshots}"
# end