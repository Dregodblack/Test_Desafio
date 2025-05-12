##################################################################################################################################
# Autor: Andre Luis
# Decrição: Metodos para a interação com o navegador
##################################################################################################################################

class CadastroPage < BasePage

    def validar_tela_de_gerenciamento
        clicar_no_elemento(*ELEMENTO_PIM)
        validar_texto("Employee Information")
    end
  
    def efetuar_cadastro
        clicar_no_elemento(*BOTAO_ADDC_FUNC)
        validar_texto("Add Employee")
        validar_elemento(*IMG_USER)
        preencher_texto(*CAMPO_PRIMEIRO_NOME, "primeiro_nome_Faker")
        preencher_texto(*CAMPO_NOME_DO_MEIO, "nome_do_meio_Faker")
        preencher_texto(*CAMPO_SOBRENOME, "sobrenome_Faker")
        preencher_texto(*CAMPO_ID_FUNCIONARIO, "valor_ID")
        clicar_no_elemento(*SELECT_ATIVAR_DETALHES)
        preencher_texto(*CAMPO_NOME_DO_USER, "usuario_Faker")
        # STATUS = default Habilitado
        preencher_texto(*CAMPO_SENHA_CADASTRO, "@Senha1234")    # senha_Faker
        preencher_texto(*CAMPO_CONFIRM_SENHA_CADASTRO, "@Senha1234")    # senha_Faker
        clicar_no_elemento(*BOTAO_SALVAR_CADASTRO)
    end

    def validar_cadastro
        validar_texto("Personal Details")
        validar_elemento(*IMG_USER)
        # validar_texto(var_ID) # apenas colocando de forma global
    end

    def efetuar_busca(funcionario, id)
        preencher_texto(*CAMPO_PESQUISA_NOME, funcionario)
        preencher_texto(*CAMPO_PESQUISA_ID, id)
        clicar_no_elemento(*BOTAO_DE_BUSCA)
        validar_elemento(*AREA_DE_REGISTRO_DE_BUSCA)
    end

    def validar_busca(funcionario, id)
        # validar_texto("(1) Record Found")
        validar_texto(funcionario)
        validar_texto(id)
        esperar
    end

    def efetuar_alteracao_de_dados(novos_dados)
        clicar_no_elemento(*BOTAO_DE_EDITAR_FUNC)
        validar_texto("Personal Details")
        validar_elemento(*IMG_USER)
        preencher_texto(*CAMPO_ALTERACAO_DE_NOME, novos_dados)
        clicar_no_elemento(*BOTAO_SALVAR_EDICAO)
    end

    def validar_alteracao_de_dados(novos_dados)
        recarregar_pagina_web
        validar_texto("Personal Details")
        validar_elemento(*IMG_USER)
        validar_texto(novos_dados)
    end

    def efetuar_exclusao
        clicar_no_elemento(*BOTAO_DE_EXCLUIR_FUNC)
        clicar_no_elemento(*BOTAO_CONFIRMACAO_DELETE_FUNC)
        esperar
        validar_elemento(*AREA_DE_REGISTRO_DE_BUSCA)
    end

    def validar_exclusao
        clicar_no_elemento(*BOTAO_DE_BUSCA)
        validar_elemento(*AREA_DE_REGISTRO_DE_BUSCA)
        validar_texto("No Records Found")
        esperar
    end

  end