<template>
  <section class="container content">
    <div class="row content-items">
      <div class="seven columns pedido">
        <p class="title">Peça seu prato aqui</p>
        <div class="choose">

          <label>Porção:</label>
          <div class="size">
            <input type="radio" value="Potito (P)" v-model="size" />Potito R$13,00
          </div>
          <div class="size">
            <input type="radio" value="Bambino (M)" v-model="size" />Bambino R$15,00
          </div>
          <div class="size">
            <input type="radio" value="Mama Mia (G)" v-model="size" />Mama Mia R$18,00
          </div>

          <label>Tipo de macarrão:</label>
          <input type="radio" value="Penne" v-model="type" />Penne
          <input type="radio" value="Talharim" v-model="type" />Talharim

          <label>Tipo de Proteina: </label>
          <input type="radio" value="Frango" v-model="protein" />Frango
          <input type="radio" value="Carne" v-model="protein" /> Carne
          <input type="radio" value="Camarao" v-model="protein" /> Camarão +R$5,00

          <label>Molhos:</label>
          <div class="sauce">
            <input type="radio" value="Tomate" v-model="sauce" />Penne
          </div>
          <div class="sauce">
            <input type="radio" value="Rose" v-model="sauce" />Rosé
          </div>
          <div class="sauce">
            <input type="radio" value="Branco" v-model="sauce" />Branco
          </div>
          <div class="sauce">
            <input type="radio" value="Cheddar" v-model="sauce" />Cheddar
          </div>

          <label>Temperos:</label>
          <div class="cond row">
            <div class="free">
              <table>
                <div>
                  <tr>
                    <input type="checkbox" value="Pimenta Calabresa" v-model="temper" />Pimenta Calabresa
                  </tr>
                </div>
                <div>
                  <tr>
                    <input type="checkbox" value="Manjericao" v-model="temper" />Manjericão
                  </tr>
                </div>
                <tr>
                  <input type="checkbox" value="Salsinha" v-model="temper" />Salsinha
                </tr>
                <tr>
                  <input type="checkbox" value="Oregano" v-model="temper" />Oregano
                </tr>
                <tr>
                  <input type="checkbox" value="Sal" v-model="temper" />Sal
                </tr>
              </table>
            </div>
          </div>

          <label>Condimentos:</label>
          <div class="cond row">
            <div class="free">

              <span style="font-weight: bold;">Ingredientes</span>
              <table>
                <tr>
                  <input type="checkbox" value="Alho" v-model="ingredient" />Alho
                </tr>
                <tr>
                  <input type="checkbox" value="Azeitona" v-model="ingredient" />Azeitona
                </tr>

                <tr>
                  <input type="checkbox" value="Bacon" v-model="ingredient" />Bacon
                </tr>

                <tr>
                  <input type="checkbox" value="Calabresa" v-model="ingredient" />Calabresa
                </tr>
                <tr>
                  <input type="checkbox" value="Cebola" v-model="ingredient" />Cebola
                </tr>
                <tr>
                  <input type="checkbox" value="Cebolinha" v-model="ingredient" />Cebolinha
                </tr>

                <tr>
                  <input type="checkbox" value="Coentro" v-model="ingredient" />Coentro
                </tr>

                <tr>
                  <input type="checkbox" value="Ervilha" v-model="ingredient" />Ervilha
                </tr>
                <tr>
                  <input type="checkbox" value="Milho" v-model="ingredient" />Milho
                </tr>
                <tr>
                  <input type="checkbox" value="Presunto" v-model="ingredient" />Presunto
                </tr>
                <tr>
                  <input type="checkbox" value="Queijo" v-model="ingredient" />Queijo
                </tr>
                <tr>
                  <input type="checkbox" value="Queijo Ralado" v-model="ingredient" />Queijo Ralado
                </tr>
                <tr>
                  <input type="checkbox" value="Tomate" v-model="ingredient" />Tomate
                </tr>
                <tr>
                  <input type="checkbox" value="Uva Passa" v-model="ingredient" />Uva Passa
                </tr>
              </table>
            </div>
            <div class="premium">
              <table>

                <span style="font-weight: bold;">Adicionais</span>
                <tr>
                  <input type="checkbox" value="Frango" v-model="aditional" />Frango + R$ 3,00
                </tr>
                <tr>
                  <input type="checkbox" value="Bacon" v-model="aditional" />Bacon + R$ 2,00
                </tr>
                <tr>
                  <input type="checkbox" value="Calabresa" v-model="aditional" />Calabresa + R$ 2,00
                </tr>
                <tr>
                  <input type="checkbox" value="Queijo Chedda" v-model="aditional" />Cheddar + R$ 2,00
                </tr>
                <tr>
                  <input type="checkbox" value="Queijo" v-model="aditional" />Queijo + R$ 2,00
                </tr>
                <tr>
                  <input type="checkbox" value="Presunto" v-model="aditional" />Presunto + R$ 2,00
                </tr>
                <tr>
                  <input type="checkbox" value="Uva Passa" v-model="aditional" />Uva Passa + R$ 1,00
                </tr>
                <tr>
                  <input type="checkbox" value="Alho" v-model="aditional" /> Alho + R$ 1,00
                </tr>
              </table>
            </div>
          </div>

          <button @click="addOrder" class="button-primary btn" :disabled="disabledButton">Adicionar</button>
        </div>
      </div>

      <div class="five columns pedido">
        <button class="accordion">Meus pedidos</button>
        <div v-for="order in cart" :key="order.id" class="accordion-content">

          <strong>Tamanho:</strong> {{ order.size }}

          <br />

          <strong>Tipo de macarrão:</strong> {{ order.type }}

          <br />

          <strong>Tipo de Proteina:</strong> {{ order.protein }}

          <br />

          <strong>Tipo de Molho:</strong> {{ order.sauce }}

          <br />

            <strong>Temperos: </strong>
            <div class="remove-colchetes" v-for="(name_temper) in order.temper" :key="name_temper">
              {{ name_temper }}, 
            </div>

          <br />

          <strong>Ingredientes:</strong>
          <div class="remove-colchetes" v-for="(name_ingredient) in order.ingredient" :key="name_ingredient">
            {{ name_ingredient }}, 
          </div>

          <br />

          <strong>Adicionais:</strong>
          <div class="remove-colchetes" v-for="(name_aditional) in order.aditional" :key="name_aditional">
           {{ name_aditional }}, 
          </div>

          <br />
          <br />

        </div>
        <div>
          <button v-show="cart.length">Finalizar Pedido</button>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  components: {},
  data: () => ({
    id: 1,

    aditionalPricesHash: {
      "frango": 3.00,
      "bacon": 2.00,
      "calabresa": 2.00,
      "cheddar": 2.00,
      "queijo": 2.00,
      "presunto": 2.00,
      "alho": 1.00,
      "uva passa": 1.00,
    },

    totalCart: 0.00,
    cart: [],
  
    temper: [],
    ingredient: [],
    aditional: [],

    protein: "",
    size: "",
    type: "",
    sauce: "",

    totalAditional: 0.00,
    priceSize: 0.00,
    totalOrder: 0.00,
  }),

  methods: {
    addOrder() {
      const order = {
        id: this.id,

        size: this.size,
        type: this.type,
        sauce: this.sauce,
        protein: this.protein,

        ingredient: this.ingredient,
        temper: this.temper,
        aditional: this.aditional,

        totalAditional: this.totalAditional,
        priceSize: this.priceSize,
        totalOrder: this.totalOrder,
      };

      this.id++;

      // this.convertValues();
      this.sizeValue();
      // this.aditionalsSumValues();
      // this.planoB();
      this.cart.push(order);
      this.refreshOrder();
    },

    convertValues() {
      parseFloat(this.priceSize);
      parseFloat(this.totalAditional);
      parseFloat(this.totalOrder);
    },

    aditionalsSumValues() {
      this.aditional.forEach(name => {
        this.totalAditional = this.totalAditional + this.aditionalPricesHash[name];
      });
    },

    refreshOrder() {
      this.size = "";
      this.type = "";
      this.sauce = "";
      this.protein = "";

      this.temper = [];
      this.aditional = [];
      this.ingredient = [];

      this.priceSize = 0.00;
      this.totalOrder = 0.00;
      this.totalAditional = 0.00;
    },

    // sumTotalOrder() {
    //   this.totalOrder = this.totalAditional + this.priceSize
    // },

    // planoB() {
    //   this.totalAditional = 0;
    //   if (this.aditional.length >= 0) {
    //     for (let n = 0; n < this.aditional.length; n++) {
    //       // const element = array[n];
    //       if (this.aditional[n] == "Frango") {
    //         this.totalAditional += 3
    //       } else if (this.aditional[n] == "Bacon") {
    //         this.totalAditional += 2
    //       } else if (this.aditional[n] == "Calabresa") {
    //         this.totalAditional += 2
    //       } else if (this.aditional[n] == "Cheddar") {
    //         this.totalAditional += 2
    //       } else if (this.aditional[n] == "Queijo") {
    //         this.totalAditional += 2
    //       } else if (this.aditional[n] == "Presunto") {
    //         this.totalAditional += 2
    //       } else if (this.aditional[n] == "Alho") {
    //         this.totalAditional += 1
    //       } else if (this.aditional[n] == "Uva Passa") {
    //         this.totalAditional += 1
    //       } else {
    //         alert('ERRO')
    //       }
    //     }
    //   } else {
    //     this.totalAditional = 0
    //   }
    // },

    // Adiciona os preços aos valores...
    // OBS: proteger os dados de alguma maneira
    sizeValue() {
      if (this.size == "Mama Mia (G)") {
        this.priceSize = 18.00;
      } else if (this.size == "Bambino (M)") {
        this.priceSize = 15.00;
      } else if (this.size == "Potito (P)") {
        this.priceSize = 13.00;
      } else {
        return alert("erro");
      }
    }
  },

  computed: {
    disabledButton() {
      if (this.size && this.type && this.sauce && this.temper && this.ingredient) {
        return false;
      }
      return true;
    },
    // printItens: () => {
    //   return this.
    // },
  }
};
</script>

<style>
</style>
