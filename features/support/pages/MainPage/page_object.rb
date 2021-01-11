module CardapioDelivery
  class MainPage
    class << self
      include Capybara::DSL

      def cardapio_button_click
        find('#menu-btn').click
      end

      def telefone_button_click
        find('#phone-btn').click
      end
    end
  end
end
