##################################################################################################################################
# Autor: Andre Luis
# Decrição: Metodos para a interação com o navegador
##################################################################################################################################

class NavegacaoPage < BasePage

    def efetuar_direcionamento(plataforma)
        clicar_no_elemento()
        validar_texto("text")
    end

    def validar_tela_de_gerenciamento
        validar_texto("text")
    end

end