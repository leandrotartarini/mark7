# language: pt

Funcionalidade: Cadastrar tarefas
    Para que eu possa organizar minhas atividades
    Sendo um usuário cadastrado
    Posso cadastrar novas tarefas

     #Próxima Sprint uma regra de negócio:
     #RN: O nome da tarefa deve ter no minimo 10 caracteres

     # Crie um cenário para validar e automatizar está regra



    # titulo, data de conclusão, tags ()\
    # titulo => ler um livro de mongodb, data => 10/06/2018, tags => mongodb, estudar, livro, leitura
    # não pode permitir o cadastro de tarefas duplicadas (pelo titulo)

    #Tambem podemos fazer com contexto de cenario
    #Contexto: Usuário logado
     #   Dado que eu fiz o login com "eu@papito.io" e "123456"

    @autenticado @logout
    Cenário: Nova tarefa
        
        #OU
        #Dado que eu tenho uma tarefa com os atributos:
        #   |nome| Ler um livro de mongodb|
        #   |data|10/06/2018|
        Dado que o nome da tarefa é "ler um livro de mongodb"
        E a data de conclusão é "10/06/2018"
        E eu quero taguear esta tarefa com:
            | tag     |
            | mongodb |
            | estudar |
            | livro   |
            | leitura |
        Quando faço o cadastro desta tarefa
        Então devo ver esta tarefa na lista com o status "Em andamento"
        E devo ver também somente 1 tarefa com o nome cadastrado 

    @autenticado @logout @tarefa_duplicada
    Cenario: Tarefa não pode ser duplicada

        Dado que o nome da tarefa é "ler um livro de Go Lang"
        E a data de conclusão é "10/06/2018"
        E eu quero taguear esta tarefa com:
            | tag      |
            | go       |
            | estudar  |
            | livro    |
            | leitura  |
            | hardcore |
        Mas eu já cadastrei essa tarefa e não tinha percebido
        Quando faço o cadastro desta tarefa
        Então devo ver a mensagem "Tarefa duplicada." ao tentar cadastrar 
        E devo ver também somente 1 tarefa com o nome cadastrado