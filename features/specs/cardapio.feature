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
    Então devera exibir em "Meus Pedidos" o numero do pedido

  # TODO: Sera se preciso mesmo implementar isso? 
  # Ideias de implementacao:
  # > Adicionar produto com items adicionais
  # > Ver alerta quando nao selecionar os items (@add_order_lock)
  #  >> o problema do alerta é implementar no site funcionalidade de alerta
  # 
  # 
  # @add_order_lock
  # Cenário: Adicionar ao Carrinho sem sucesso
  #   Dado que esteja na pagina de menu
  #   Quando não selecionar todos os ingredientes
  #   Então o botão Adicionar ao Carrinho não estera liberado
  #   E devera exibir alerta "Ingredientes não foram adicionados"

  @finish_order
  Cenário: Finalizar o pedido
    Dado que esteja na pagina de menu
    E tenha adicionado um produto ao carrinho
    Quando clicar no botão Finalizar Pedido
    Então devera exibir no titulo "Converse com +55 75 99894-3730 no WhatsApp"
