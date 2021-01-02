<template>
  <v-col cols="12" sm="5">
    <v-card elevation="6">
      <v-card-title primary-title class="justify-center">Meus Pedidos</v-card-title>
      <v-divider class="mx-4"></v-divider>
      <v-list-item v-for="order in cart" :key="order.id">
        <v-list-item-content>
          <v-list-item-title>
            <strong>Pedido:</strong> {{order.id}}
          </v-list-item-title>
          <p><strong>Tamanho:</strong> {{order.size}}</p>
          <p><strong>Macarrão:</strong> {{order.type}}</p>
          <p><strong>Molho:</strong> {{order.sauce}}</p>
          <p><strong>Temperos:</strong> {{order.temper}}</p>
          <p><strong>Ingredientes:</strong> {{order.ingredients}}</p>
          <p><strong>Adicionais:</strong> {{order.aditional}}</p>
        </v-list-item-content>
      </v-list-item>
      <v-card-actions>
        <v-btn
          :href="this.baseUrl + this.cartString"
          v-show="cart.length"
          color="orange"
        >Finalizar Pedido</v-btn>
      </v-card-actions>
    </v-card>
  </v-col>
</template>

<script>
import EventBus from '../eventBus.js'

export default {
  data() {
    return {
      cart: [],
      cartString: "",
      baseUrl: "https://api.whatsapp.com/send?phone=5575998943730&text=",
    };
  },

  created() {
    EventBus.$on("send-to-cart", cart => { this.cart = cart; });
    EventBus.$on("cart-string", cartString => { this.cartString = cartString; });
  },
  methods: {}
}
</script>

<style>
</style>