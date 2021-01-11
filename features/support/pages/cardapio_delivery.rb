# Modulo de CardapioDelivery abstrai estrutura principal da pagina.
# 
# Modulo que devera conter apenas as rotas de paginas.
# As rotas chamadas possuem classes que deverao ser instanciadas
# sem a necessidade de usar variaveis.
module CardapioDelivery
  class << self
    include Capybara::DSL

    # Acessa pagina raiz do projeto
    # 
    # Verificar => MainPage
    def main_page
      visit '/'
    end

    # Acessa pagina de menu do projeto
    #
    # Verificar => MenuPage
    def menu_page
      visit '/menu'
    end
  end
end
