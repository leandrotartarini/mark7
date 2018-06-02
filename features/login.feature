#language: pt

Funcionalidade: Login
    Para que somente eu possa ver as minhas tasks
    Sendo um usuário cadastrado
    Posso logar no sistema

    # depois de implementar, transformar os cenários sem sucesso para scenario outline (esquema do cenário)

    Contexto: Formulário
        Dado que acessei o formulário de login

    @logout @login @smoke
    Cenario: Login do usuário

        Quando faço login com "eu@leandro.io" e "123456"
        Então sou autenticado com sucesso

    Esquema do Cenario: Dados inválidos

        Quando faço login com "<email>" e "<senha>"
        Entao vejo a mensagem de alerta de login "<saida>"

        Exemplos:
        |email                      | senha   | saida                      | 
        |eu@leandro.io              | xpto123 | Senha inválida.            |
        |padre.kevedo@noekxiste.org | 123456  | Usuário não cadastrado.    |
        |eu$papito.io               | xpto123 | Email incorreto ou ausente.|
        
    #Cenario: Senha inválida
        
    #    Quando faço login com "eu@papito.io" e "xpto123"
    #    Então vejo a mensagem de alerta "Senha inválida."

    #Cenario: Usuário não cadastrado

     #   Quando faço login com "padre.kevedo@noekxiste.org" e "123456"
      #  Então vejo a mensagem de alerta "Usuário não cadastrado."

    #Cenário: Email incorreto

     #   Quando faço login com "eu&papito.io" e "xpto123"
      #  Então vejo a mensagem de alerta "Email incorreto ou ausente."