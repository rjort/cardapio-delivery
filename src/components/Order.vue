<template>
  <v-col cols="12" sm="7">
    <v-card>
      <v-card-title>Monte seu Macarrão</v-card-title>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>Tamanho:</v-list-item-title>
          <v-radio-group v-model="newSize" row>
            <v-radio class="py-2" v-for="(s,i) in size" :key="s" :label="s" :value="size[i]"></v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>Macarrão:</v-list-item-title>
          <v-radio-group v-model="newType" row>
            <v-radio class="py-2" v-for="(t, i) in type" :key="t" :label="t" :value="type[i]"></v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>Molho:</v-list-item-title>
          <v-radio-group v-model="newSauce" row>
            <v-radio class="py-2" v-for="(s, i) in sauce" :key="s" :label="s" :value="sauce[i]"></v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>Proteina:</v-list-item-title>
          <v-radio-group v-model="newProtein" row>
            <v-radio class="py-2" v-for="(p, i) in protein" :key="p" :label="p" :value="protein[i]"></v-radio>
          </v-radio-group>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>Temperos:</v-list-item-title>
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
          <v-list-item-title>Ingredientes:</v-list-item-title>
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
          <v-list-item-title>Adicionais:</v-list-item-title>
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
import EventBus from "../event-bus";

export default {
  data: () => ({
    cart: [],
    id: 1,
    newSize: "",
    newType: "",
    newSauce: "",
    newProtein: "",
    newTemper: [],
    newIngredient: [],
    newAditional: [],
    size: ["Potito", "Bambino", "Mama Mia"],
    type: ["Penne", "Talharim"],
    sauce: ["Penne", "Branco", "Rosé", "Cheddar"],
    protein: ["Carne", "Frango", "Camarão"],
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
      "Frango + R$ 3,00",
      "Bacon + R$ 2,00",
      "Calabresa + R$ 2,00",
      "Cheddar + R$ 2,00",
      "Queijo + R$ 2,00",
      "Presunto + R$ 2,00",
      "Uva Passa + R$ 1,00",
      "Alho + R$ 1,00"
    ]
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

      this.cart.push(order);

      this.refreshOrder();

      this.sendToCart();
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
    sendToCart() {
      EventBus.$emit("send-to-cart", this.cart);
    }
  }
};
</script>

<style>
</style>