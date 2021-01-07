<template>
  <v-col cols="12" sm="7">
    <v-card elevation="6">
      <v-card-title id="titulo" primary-title class="justify-center">Monte seu Macarrão</v-card-title>
      <v-divider class="mx-4"></v-divider>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Tamanho:</strong></v-list-item-title>
          <v-radio-group name="tamanhos" v-model="newSize" row>
            <v-radio
              name="tamanho"
              class="py-2"
              v-for="s in size" 
              :key="s"
              :label="s.name"
              :value="s.value">
            </v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Tipo de Massa:</strong></v-list-item-title>
          <v-radio-group name="massas" v-model="newType" row>
            <v-radio
              name="massa"
              class="py-2"
              v-for="(t,i) in type"
              :key="t"
              :label="t"
              :value="type[i]">
            </v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Molho:</strong></v-list-item-title>
          <v-radio-group name="molhos" v-model="newSauce" row>
            <v-radio
              name="molho"
              class="py-2"
              v-for="s in sauce"
              :key="s"
              :label="s.name"
              :value="s.value">
            </v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Proteinas:</strong></v-list-item-title>
          <v-radio-group name="proteinas" v-model="newProtein" row>
            <v-radio
              name="proteina"
              class="py-2"
              v-for="p in protein"
              :key="p"
              :label="p.name"
              :value="p.value">
            </v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Temperos:</strong></v-list-item-title>
          <v-row>
            <v-checkbox
              name="temperos"
              class="px-3"
              v-for="t in temper"
              :key="t"
              :label="t"
              :value="t"
              v-model="newTemper"
            ></v-checkbox>
          </v-row>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Ingredientes:</strong></v-list-item-title>
          <v-row>
            <v-checkbox
              name="ingredientes"
              class="px-3"
              v-for="ing in ingredients"
              :key="ing"
              :label="ing"
              :value="ing"
              v-model="newIngredient"
            ></v-checkbox>
          </v-row>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Adicionais:</strong></v-list-item-title>
          <v-row>
            <v-checkbox
              name="adicionais"
              class="px-3"
              v-for="a in aditional"
              :key="a"
              :label="a.name"
              :value="a.value"
              v-model="newAditional"
            ></v-checkbox>
          </v-row>
        </v-list-item-content>
      </v-list-item>

      <v-card-actions>
        <v-btn
          @click="addOrder"
          color="orange"
          :disabled="disabledCartButton()"
        >Adicionar ao Carrinho</v-btn>
      </v-card-actions>
    </v-card>
  </v-col>
</template>

<script>
import EventBus from "../eventBus.js";

export default {
  data: () => ({
    cart: [],
    cartString: "",
    printCart: [],
    id: 1,
    newSize: "",
    newType: "",
    newSauce: "",
    newProtein: "",
    newTemper: [],
    newIngredient: [],
    newAditional: [],
    size: [
      { name: "Potito - R$ 13.00",    value: "Potito" },
      { name: "Bambino - R$ 15.00",   value: "Bambino" },
      { name: "Mama Mia - R$ 18.00",  value: "Mama Mia" }
    ],
    type: ["Penne", "Talharim"],
    sauce: [
      {name:"Tomate",             value: "Tomate"},
      {name:"Branco",             value: "Branco"},
      {name:"Rosé",               value: "Rose"},
      {name:"Cheddar + R$ 3.00",  value: "Cheddar"}
    ],
    protein: [
      {name:"Carne",              value:"Carne"},
      {name:"Frango",             value:"Frango"},
      {name:"Camarão + R$ 5.00",  value:"Camarao"}
    ],
    temper: [
      "Pimenta Calabresa",
      "Manjeiricão",
      "Sal",
      "Alho",
      "Salsinha",
      "Oregano"
    ],
    ingredients: [
      "Alho",
      "Azeitona",
      "Bacon",
      "Calabresa",
      "Cebola",
      "Cebolinha",
      "Coentro",
      "Ervilha",
      "Milho",
      "Presunto",
      "Queijo",
      "Queijo Ralado",
      "Tomate",
      "Uva Passa"
    ],
    aditional: [
      {name: "Frango  + R$ 3.00",     value: "Frango"},
      {name: "Bacon + R$ 2.00",       value: "Bacon"},
      {name: "Calabresa + R$ 2.00",   value: "Calabresa"},
      {name: "Cheddar + R$ 2.00",     value: "Cheddar"},
      {name: "Queijo + R$ 2.00",      value: "Queijo"},
      {name: "Presunto + R$ 2.00",    value: "Presunto"},
      {name: "Uva Passa + R$ 1.00",   value: "Uva Passa"},
      {name: "Alho + R$ 1.00",        value: "Alho"},
    ],

    _tempTemper: "",
    _tempIngredients: "",
    _tempAditional: "",

    priceTotalOrder: 0.0,
    priceTotalCart: 0.0,
    priceTotalAditional: 0.0,

    _tempPriceAditional: 0.0,
    _tempPriceSize: 0.0,
    _tempPriceProtein: 0.0,
    _tempPriceSauce: 0.0,
  }),

  methods: {
    addOrder() {
      const order = {
        id: this.id,
        size: this.newSize,
        type: this.newType,
        sauce: this.newSauce,
        protein: this.newProtein,
        temper: this.newTemper,
        ingredients: this.newIngredient,
        aditional: this.newAditional,
        priceOrder: this.priceTotalOrder,
        priceCart: this.priceTotalCart,
        priceAditional: this.priceTotalAditional,
      };

      this.id++;
      this.cartJoinItens(order);
      this.joinOtherItens(order);
      this.addPrices();
      this.cart.push(order);
      this.refreshOrder();
      this.sendToCartEvent();
      this.cartStringEvent();
    },

    addPrices() {

      // ADICIONA PRECO NO TIPO DE PROTEINA
      if(this.newProtein.value == "Camarao") {
        this._tempPriceProtein = 5.0
      } else {
        this._tempPriceProtein = 0.0
      }

      // ADICIONA O SOMATORIO DOS PRECOS NOS ADICIONAIS
      if(this.newAditional.length > 0) {
        for (let index = 0; index < this.newAditional.length; index++) {
          if(this.newAditional[index] == "Frango") {
            this._tempPriceAditional += 3.0
          }
          else if (this.newAditional[index] == "Bacon") {
            this._tempPriceAditional += 2.0
          }
          else if (this.newAditional[index] == "Calabresa") {
            this._tempPriceAditional += 2.0
          }
          else if (this.newAditional[index] == "Cheddar") {
            this._tempPriceAditional += 2.0
          }
          else if (this.newAditional[index] == "Queijo") {
            this._tempPriceAditional += 2.0
          }
          else if (this.newAditional[index] == "Presunto") {
            this._tempPriceAditional += 2.0
          }
          else if (this.newAditional[index] == "Uva Passa") {
            this._tempPriceAditional += 1.0
          }
          else if (this.newAditional[index] == "Alho") {
            this._tempPriceAditional += 1.0
          }
          else {
            alert('error')
          }
        }
      } else {
        this._tempPriceAditional = 0.0
      }

      console.log(this._tempPriceAditional)
      console.log(this._tempPriceProtein)
    },

    disabledCartButton() {
      if (
        this.newSize &&
        this.newType &&
        this.newSauce &&
        this.newProtein &&
        this.newTemper &&
        this.newIngredient
      ) {
        return false;
      }
      return true;
    },

    refreshOrder() {
      (this.newSize = ""),
        (this.newType = ""),
        (this.newSauce = ""),
        (this.newProtein = ""),
        (this.newTemper = []),
        (this.newIngredient = []),
        (this.newAditional = []);
    },

    cartJoinItens(order) {
      this.printCart.push("Pedido:")
      this.printCart.push(order.id + " | ")
      this.printCart.push("Tamanho:");
      this.printCart.push(order.size + " | ");
      this.printCart.push("Macarrao:");
      this.printCart.push(order.type + " | ");
      this.printCart.push("Proteina:");
      this.printCart.push(order.protein + " | ");
      this.printCart.push("Molho:");
      this.printCart.push(order.sauce + " | ");
      
      this.printCart.push("Temperos:");
      for (let index = 0; index < order.temper.length; index++) {
        if (index == order.temper.length -1) {
          this.printCart.push(order.temper[index] + " ");
        } else {
          this.printCart.push(order.temper[index] + ",");
        }
      }
      this.printCart.push(" | ");
      this.printCart.push("Ingredientes:");
      for (let index = 0; index < order.ingredients.length; index++) {
        if (index == order.ingredients.length - 1) {
          this.printCart.push(order.ingredients[index] + " ");
        } else {
          this.printCart.push(order.ingredients[index] + ",");
        }
      }
      this.printCart.push(" | ");
      this.printCart.push("Adicionais:");
      for (let index = 0; index < order.aditional.length; index++) {
        if (index == order.aditional.length - 1) {
          this.printCart.push(order.aditional[index] + " ");
        } else {
          this.printCart.push(order.aditional[index] + ",");
        }
      }
      this.printCart.push("%0A");
      this.cartString = this.printCart.join(" ");
    },

    sendToCartEvent() { EventBus.$emit("send-to-cart", this.cart); },
    cartStringEvent() { EventBus.$emit("cart-string", this.cartString); },

    joinOtherItens(order) {
      this._tempTemper = order.temper.join(', ');
      this._tempIngredients = order.ingredients.join(', ');
      this._tempAditional = order.aditional.join(', ');
      order.temper = [];
      order.ingredients = [];
      order.aditional = [];
      order.temper = this._tempTemper;
      order.ingredients = this._tempIngredients;
      order.aditional = this._tempAditional;
    },
  }
};
</script>

<style>
</style>