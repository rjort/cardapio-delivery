Dado('que esteja na pagina principal') do
  visit 'http://localhost:8080/'
end

Quando('clicar no botão Fazer Pedido') do
  find('#menu-btn').click
end

Então('devera exibir no titulo do card {string}') do |title_msg|
  title = find('#titulo')
  expect(title).to have_content title_msg
end

Quando('selecionar todos os ingredientes') do
end

Então('o botão Adicionar ao Carrinho estara libererado') do
end

Quando('não selecionar todos os ingredientes') do
end

Então('o botão Adicionar ao Carrinho não estera liberado') do
end

Dado('tenha adicionado produtos ao carrinho') do
end

Quando('clicar no botão Finalizar Pedido') do
end

Então('mostrar no paragrafo na pagina informações do pedido') do
end
