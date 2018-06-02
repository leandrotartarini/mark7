  Dado("que o nome da tarefa é {string}") do |nome_tarefa|
    @nome_tarefa = nome_tarefa
    DAO.new.remover_tarefas(@nome_tarefa)
  end
  
  Dado("a data de conclusão é {string}") do |data_conclusao|
    @data_conclusao = data_conclusao
  end
  
  Dado("eu quero taguear esta tarefa com:") do |table_tags|
    @tags = table_tags.hashes #faz com que a variavel tenha um array de tarefas    
  end

  Dado("eu já cadastrei essa tarefa e não tinha percebido") do
    steps %(
      Quando faço o cadastro desta tarefa
    )
  end
  
  Quando("faço o cadastro desta tarefa") do
    @tarefas_page.botao_adicionar.click
    @tarefas_page.adicionar.nova(@nome_tarefa, @data_conclusao, @tags)
  end
  
  Então("devo ver esta tarefa na lista com o status {string}") do |status_tarefa|
    tarefa_cadastrada = find('table tbody tr', text: @nome_tarefa) 
    expect(tarefa_cadastrada).to have_content status_tarefa
  end
    
  Então("devo ver a mensagem {string} ao tentar cadastrar") do |mensagem_alerta|
    res = @tarefas_page.adicionar.alerta.text
    expect(res).to eql mensagem_alerta
  end
  
  Então("devo ver também somente {int} tarefa com o nome cadastrado") do |quantidade|
    @tarefas_page.load
    @tarefas_page.busca(@nome_tarefa)
    expect(@tarefas_page.lista.size).to eql quantidade
  end

  # Apagar tarefa

  Dado("que a tarefa indesejada é {string}") do |nome_tarefa|
    @tarefa = { nome: nome_tarefa, data: '10/07/2018', tags: %w['test1', 'teste2']}
    
    #preciso chamar o metodo que cadastra uma nova tarefa
  end
  
  Quando("eu solicito a exclusão des tarefa #clicar no botão apagar da tarefa cadastrada \(strategy em tarefas_steps linha {int})") do |int|
    para_remover = find('table tbody tr', text: @tarefa[:nome])
    para_remover.find('elemento_botao_apagar').click
  end
  
  Quando("confirmo a solicitação de exclusão") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então("esta tarefa não deve ser exibida na lista") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando("eu solicito a exclusão desta tarefa") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando("cancelo esta solicitação de exclusão") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então("continuo vendo esta tarefa na lista") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  