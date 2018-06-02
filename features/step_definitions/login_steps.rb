Dado('que acessei o formulário de login') do
    @login_page.load
end

Quando('faço login com {string} e {string}') do |email, senha|
    @login_page.logar(email, senha)
    @email = email
end

Então('sou autenticado com sucesso') do
    expect(@navbar.nav).to have_content @email
    @tarefas_page.wait_for_lista
end

Então('vejo a mensagem de alerta de login {string}') do |mensagem_alerta|
    expect(@login_page.alerta.text).to eql mensagem_alerta
end
