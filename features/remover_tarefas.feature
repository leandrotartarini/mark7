# language: pt

Funcionalidade: Remover uma tarefa
    Para que eu possa deixar minhas tarefas organizadas
    Sendo um usuário que criou uma tarefa indesejada
    Posso excluir uma tarefa

    Cenario: Apagar uma tarefa indesejada

        Dado que a tarefa indesejada é "Tarefa muito boa para ser removida"
        Quando eu solicito a exclusão des tarefa #clicar no botão apagar da tarefa cadastrada (strategy em tarefas_steps linha 26)
        E confirmo a solicitação de exclusão
        Então esta tarefa não deve ser exibida na lista

    Cenario: Desistir da remoção

        Dado que a tarefa indesejada é "Tarefa muito boa para desistir da remoção"
        Quando eu solicito a exclusão desta tarefa
        E cancelo esta solicitação de exclusão
        Então continuo vendo esta tarefa na lista