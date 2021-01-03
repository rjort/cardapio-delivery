Dado('que esteja na pagina principal') do
  visit 'http://localhost:8080/'
  sleep 5
end

Quando('clicar no botão Fazer Pedido') do
  find('#menu-btn').click
end

Então('devera exibir no titulo do card {string}') do |string|
  find('#titulo')
  sleep 5
end

Quando('selecionar todos os ingredientes') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('o botão Adicionar ao Carrinho estara libererado') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('não selecionar todos os ingredientes') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('o botão Adicionar ao Carrinho não estera liberado') do
  pending # Write code here that turns the phrase above into concrete actions
end

Dado('tenha adicionado produtos ao carrinho') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('clicar no botão Finalizar Pedido') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('mostrar no paragrafo na pagina informações do pedido') do
  pending # Write code here that turns the phrase above into concrete actions
end