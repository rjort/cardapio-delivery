# language: pt

Funcionalidade: Fazer pedido
  O usuario quer fazer um pedido

  # Contexto:
  #   Dado que esteja na pagina inicial

  @menu_page
  Cenário: Ir para pagina de menu
    Dado que esteja na pagina principal
    Quando clicar no botão Fazer Pedido
    Então devera exibir no titulo do card "Monte seu Macarrão"
  
  @add_order_success
  Cenário: Adicionar ao Carrinho com sucesso
    Dado que esteja na pagina principal
    Quando clicar no botão Fazer Pedido
    E selecionar todos os ingredientes
    Então o botão Adicionar ao Carrinho estara libererado

  @add_order_failure
  Cenário: Adicionar ao Carrinho sem sucesso
    Dado que esteja na pagina principal
    Quando clicar no botão Fazer Pedido
    E não selecionar todos os ingredientes
    Então o botão Adicionar ao Carrinho não estera liberado
  
  @finish_order
  Cenário: Finalizar o pedido
    Dado tenha adicionado produtos ao carrinho
    Quando clicar no botão Finalizar Pedido
    Então mostrar no paragrafo na pagina informações do pedido
