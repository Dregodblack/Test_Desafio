##################################################################################################################################
# Autor: Andre Luis
# Decrição:  Metodos para a interação com a Suite principal
##################################################################################################################################

# Validar direcionamento para meios de comunicação
Quando('clico no ícone de plataforma {string}') do |plataforma|
    pagina.funcao_Navegacao.efetuar_direcionamento(plataforma)
end

Quando('valido que sou redirecionado para a página da plataforma {string}') do |plataforma|
    pagina.funcao_Navegacao.validar_direcionamento(plataforma)
end