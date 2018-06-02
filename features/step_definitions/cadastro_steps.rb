Dado('que eu estou no formulário de cadastro') do
  @cadastro_page.load
end

Dado('possuo os seguintes dados:') do |table|
  @usuario = table.rows_hash
  DAO.new.remover_usuario(@usuario[:email])
end

Dado('ja existe um cadastro para o email informado') do
  @cadastro_page.cadastra(@usuario)
  @navbar.wait_for_nav
  @navbar.desloga
  @cadastro_page.wait_for_formulario
  @cadastro_page.load

end

Quando('faço o meu cadastro') do
  @cadastro_page.cadastra(@usuario)
end

Então('vejo a mensagem {string}') do |ola_usuario|
  expect(page).to have_content ola_usuario
end

Então('vejo a mensagem de alerta {string}') do |mensagen_alerta|
  expect(@cadastro_page.div_alerta.text).to eql mensagen_alerta
end
