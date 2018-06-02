#language: pt
Funcionalidade: Cadastro de usuários
    Sendo um visitante
    Posso fazer meu cadastro
    Para poder gerenciar minhas tarefas

    Contexto: Formulário
        Dado que eu estou no formulário de cadastro

    @logout @limpa_usuario
    Cenário: Cadastro simples
        
        E possuo os seguintes dados:
            | nome  | Leandro              |
            | email | leandro@qaninja.net  |
            | senha | 123456               |
        Quando faço o meu cadastro 
        Então vejo a mensagem "Olá, Leandro"
  
    Cenario: Senha com minimo de caracteres

        E possuo os seguintes dados:
            | nome  | Leandro             |
            | email | leandro@qaninja.net |
            | senha | 12345               |
        Quando faço o meu cadastro
        Então vejo a mensagem de alerta "Sua senha deve ter pelo menos 6 caracteres."
 
    Cenario: Email incorreto

        E possuo os seguintes dados:
        | nome  | Leandro             |
        | email | leandro&qaninja.net |
        | senha | 123456              |
        Quando faço o meu cadastro
        Então vejo a mensagem de alerta "Informe um email válido."

    @limpa_usuario
    Cenario: Cadastro duplicado

        E possuo os seguintes dados:
            | nome  | Papito             |
            | email | papito@qaninja.net |
            | senha | 123456             |
        Mas ja existe um cadastro para o email informado
        Quando faço o meu cadastro
        Então vejo a mensagem de alerta "Email já existe."

    @required
    Esquema do Cenario: Campos obrigatórios

        E possuo os seguintes dados:
        | nome  | <nome>  |
        | email | <email> |
        | senha | <senha> |
        Quando faço o meu cadastro 
        Então vejo a mensagem "<saida>"

        Exemplos:
            | nome     | email                | senha  | saida                |
            |          | leandro@qaninja.net  | 123456 | Nome é obrigatório.  |
            | Leandro  |                      | 123456 | Email é obrigatório. |
            | Leandro  | leandro@qaninja.net  |        | Informe uma senha.   |
 
