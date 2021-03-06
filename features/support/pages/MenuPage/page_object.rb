module CardapioDelivery
  # MenuPage :: Estrutura da pagina de menu
  #
  # Contem elementos de acesso a pagina de menu e acoes
  class MenuPage
    class << self
      include Capybara::DSL

      # Titulo do card de menu
      def title_menu()
        find('div[id="titulo"]')
      end

      # Titulo do card de carrinho
      def title_cart()
        find('div[id="title-cart"]')
      end

      # Acao para selecionar todas as opcoes
      def select_all_options()
      end

      def button_add_cart()
        within('#field-order') do
          find('#add-order').click
        end
      end

      def whatsapp_title_check
        find('#top-of-page')
      end

      def button_finish_order()
        within('#btn-actions') do
          find('#finish').click
        end
      end

      # Usado para fazer a verificacao se um pedido foi adicionado ao carrinho
      def id_order
        find('#order-id')
      end

      def check_id_order
        yield(id_order()) if block_given?
      end

      # Acao para selecionar todas as opcoes menos as adicionais
      #
      # v:1.0 de funcionamento
      # Verificar o codigo e depois tentar melhorar
      def select_options_without_aditional()
        clicks_values = {}
        create_rand_values()
        # sleep 2
        # binding.pry
        choose('tamanho', name: 'tamanho', option: @value[:tamanho], allow_label_click: true)
        choose('massa', name: 'massa', option: @value[:massa], allow_label_click: true)
        choose('molho', name: 'molho', option: @value[:molho], allow_label_click: true)
        choose('proteina', name: 'proteina', option: @value[:proteina], allow_label_click: true)
        
        # TODO: Verificar uma maneira de chegar os campos das labels para checar o click
        # e passa-lo pelo yield() para fazer uma verificacao com expect().to be_checked
        # Exemplo
        # #
        # clicks_values[:tamanho] = find_field(@value[:tamanho], checked: true)
        # clicks_values[:massa] = find_field(@value[:massa], checked: true)
        # clicks_values[:molho] = find_field(@value[:molho], checked: true)
        # clicks_values[:proteina] = find_field(@value[:proteina], checked: true)
        # yield(clicks_values) if block_given?
        # # # # # # VERFICAR NO CARDAPIO_STEPS CONTINUACAO DO CODIGO # # # # # # 
      end

      # Verifica um titulo por um bloco, passando o titulo experado
      # Exp:
      # 
      #  CardapioDelivery::MenuPage.check_title(title) { |title| ... }
      # 
      def check_title(title)
        yield(title)
      end

      private

      # TODO: de alguma maneira tambem tentar popular essa area com os valores ja inseridos
      # no site. Ideia basica: fazer um parse e adicionar cada tipo ja criando o hash.
      def create_rand_values()
        @value = {}
        @value = { 
            tamanho: ["Potito", "Bambino", "Mama Mia"].sample,
            proteina: ["Carne", "Frango", "Camarao"].sample,
            molho: ["Tomate", "Branco", "Rosé", "Cheddar"].sample,
            massa: ["Penne", "Talharim"].sample
        }
      end
    end
  end
end
