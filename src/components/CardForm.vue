<template>
  <v-col cols="12" sm="7">
    <v-card elevation="6">
      <v-card-title primary-title class="justify-center">Monte seu Macarrão</v-card-title>
      <v-divider class="mx-4"></v-divider>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Tamanho:</strong></v-list-item-title>
          <v-radio-group v-model="newSize" row>
            <v-radio class="py-2" v-for="s in size" :key="s" :label="s.value" :value="s.name"></v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Tipo de Massa:</strong></v-list-item-title>
          <v-radio-group v-model="newType" row>
            <v-radio class="py-2" v-for="(t, i) in type" :key="t" :label="t" :value="type[i]"></v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Molho:</strong></v-list-item-title>
          <v-radio-group v-model="newSauce" row>
            <v-radio class="py-2" v-for="(s, i) in sauce" :key="s" :label="s" :value="sauce[i]"></v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Proteinas:</strong></v-list-item-title>
          <v-radio-group v-model="newProtein" row>
            <v-radio class="py-2" v-for="(p, i) in protein" :key="p" :label="p" :value="protein[i]"></v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title><strong>Temperos:</strong></v-list-item-title>
          <v-row>
            <v-checkbox
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
              class="px-3"
              v-for="a in aditional"
              :key="a"
              :label="a"
              :value="a"
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
      { name: "Potito", value: "Potito - R$ 13.00" },
      { name: "Bambino", value: "Bambino - R$ 15.00" },
      { name: "Mama Mia", value: "Mama Mia - R$ 18.00" }
    ],
    type: ["Penne", "Talharim"],
    sauce: ["Tomate", "Branco", "Rosé", "Cheddar + R$ 3.00"],
    protein: ["Carne", "Frango", "Camarão + R$ 5.00"],
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
      "Frango + R$ 3.00",
      "Bacon + R$ 2.00",
      "Calabresa + R$ 2.00",
      "Cheddar + R$ 2.00",
      "Queijo + R$ 2.00",
      "Presunto + R$ 2.00",
      "Uva Passa + R$ 1.00",
      "Alho + R$ 1.00"
    ],
    _tempTemper: "",
    _tempIngredients: "",
    _tempAditional: "",
  }),

  methods: {
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

    addOrder() {
      const order = {
        id: this.id,
        size: this.newSize,
        type: this.newType,
        sauce: this.newSauce,
        protein: this.newProtein,
        temper: this.newTemper,
        ingredients: this.newIngredient,
        aditional: this.newAditional
      };
      this.id++;
      this.cartJoinItens(order);
      this.joinOtherItens(order);
      this.cart.push(order);
      this.refreshOrder();
      this.sendToCartEvent();
      this.cartStringEvent();
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

    sendToCartEvent() {
      EventBus.$emit("send-to-cart", this.cart);
    },

    cartStringEvent() {
      EventBus.$emit("cart-string", this.cartString);
    },

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