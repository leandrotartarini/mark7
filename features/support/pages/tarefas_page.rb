
# Adicionar é a classe que representa a seção da sub pagina adicionar tarefas
class Adicionar < SitePrism::Section
    element :campo_nome, '#title'
    element :campo_data, '#dueDate'
    element :campo_tags, '.bootstrap-tagsinput input'
    element :botao_cadastrar, '#form-submit-button'
    element :alerta, '.alert-warn'

    def nova(nome, data_tarefa, tags)
        campo_nome.set nome
        campo_data.set data_tarefa
        adicionar_tags(tags)
        botao_cadastrar.click
    end

    def adicionar_tags(tags)
        tags.each do |t|
            campo_tags.set t[:tag]
            campo_tags.send_keys :tab
        end
    end
end

# TarefasPage é a classe que representa a pagina principal onde temos a lista de tarefas
class TarefasPage < SitePrism::Page
    set_url '/tasks'
    element :botao_adicionar, '#insert-button'
    element :campo_busca, 'input[placeholder=Buscar]'
    element :botao_busca, '#search-button'

    elements :lista, 'table tbody tr'

    section :adicionar, Adicionar, '#add-task-view'

    def busca(valor)
        campo_busca.set valor
        botao_busca.click
    end

end