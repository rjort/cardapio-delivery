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
  CardapioDelivery::MenuPage.select_options_without_aditional

  #  CardapioDelivery::MenuPage.select_options_without_aditional do |value|
  #   expect(value[:tamanho]).to be_checked
  #   expect(value[:massa]).to be_checked
  #   expect(value[:molho]).to be_checked
  #   expect(value[:proteina]).to be_checked
  # end
end

Então('o botão Adicionar ao Carrinho estara liberado') do
end

Então('devera exibir no carrinho numero do pedido') do
end

Quando('não selecionar todos os ingredientes') do
end

Então('o botão Adicionar ao Carrinho não estera liberado') do
end

Então('devera exibir alerta {string}') do |string|
end

Dado('tenha adicionado produtos ao carrinho') do
end

Quando('clicar no botão Finalizar Pedido') do
end

Então('mostrar no paragrafo na pagina informações do pedido') do
end