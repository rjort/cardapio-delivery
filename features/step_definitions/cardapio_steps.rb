Dado('que esteja na pagina principal') do
  CardapioDelivery::main_page
end

Quando('clicar no botão Fazer Pedido') do
  CardapioDelivery::MainPage.cardapio_button_click
end

Então('devera exibir no titulo do card {string}') do |title|
  CardapioDelivery::MenuPage.check_title(title) do |title|
    expect(CardapioDelivery::MenuPage.title_menu).to have_content title
  end
end

Dado('que esteja na pagina de menu') do
  CardapioDelivery::menu_page
end

Quando('selecionar todos os ingredientes') do
  # Bug quando seleciona as opções ao implementar o 'check_id_order'
  # onde nao esta selecionando todos os dois ultimos radio buttons
  # ao adicionar o sleep o teste é feio com sucesso.
  # TODO: verificar descricao do bug acima

  # binding.pry
  CardapioDelivery::MenuPage.select_options_without_aditional
  # sleep 5
  # CardapioDelivery::MenuPage.select_options_without_aditional do |value|
  #   value.each do | key, value |
  #     expect(value).to be_checked
    # end
    # expect(value[:tamanho]).to be_checked
    # expect(value[:massa]).to be_checked
    # expect(value[:molho]).to be_checked
    # expect(value[:proteina]).to be_checked
  # end

end

Quando('clicar no botão de Adicionar ao Carrinho') do
  CardapioDelivery::MenuPage.button_add_cart
end

Então('devera exibir em {string} o numero do pedido') do |title|
  # binding.pry
  expect(CardapioDelivery::MenuPage.title_cart).to have_content title
  sleep 2
  # CardapioDelivery::MenuPage.check_id_order do | order |
  #   expect(page).to have_content order
  # end
end

# Quando('não selecionar todos os ingredientes') do
# end

# Então('o botão Adicionar ao Carrinho não estera liberado') do
# end

# Então('devera exibir alerta {string}') do |string|
# end

Dado('tenha adicionado um produto ao carrinho') do
  CardapioDelivery::MenuPage.select_options_without_aditional
  CardapioDelivery::MenuPage.button_add_cart
end

Quando('clicar no botão Finalizar Pedido') do
  CardapioDelivery::MenuPage.button_finish_order
end

Então('devera exibir no titulo {string}') do | title | 
  expect(CardapioDelivery::MenuPage.whatsapp_title_check).to have_content title
end

