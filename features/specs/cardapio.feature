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
    Dado que esteja na pagina de menu
    Quando selecionar todos os ingredientes
    E clicar no botão de Adicionar ao Carrinho
    Então devera exibir no carrinho numero do pedido

  @add_order_failure
  Cenário: Adicionar ao Carrinho sem sucesso
    Dado que esteja na pagina de menu
    Quando não selecionar todos os ingredientes
    Então o botão Adicionar ao Carrinho não estera liberado
    E devera exibir alerta "Indredientes não foram adicionados"
  
  # TODO:
  # > refatorar 'Então'
  @finish_order
  Cenário: Finalizar o pedido
    Dado que esteja na pagina de menu
    E tenha adicionado produtos ao carrinho
    Quando clicar no botão Finalizar Pedido
    Então mostrar no paragrafo na pagina informações do pedido
