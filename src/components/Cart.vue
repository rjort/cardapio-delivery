<template>
  <v-col cols="12" sm="5">
    <v-card>
      <v-card-title>Meus Pedidos</v-card-title>
      <v-list-item v-for="order in cart" :key="order.id">
        <v-list-item-content>
          <v-list-item-title>
            <strong>Pedido: {{order.id}}</strong>
          </v-list-item-title>
          <p>Tamanho: {{order.size}}</p>
          <p>Macarrão: {{order.type}}</p>
          <p>Molho: {{order.sauce}}</p>
          <p>Temperos: {{order.temper}}</p>
          <p>Ingredientes: {{order.ingredients}}</p>
          <p>Adicionais: {{order.aditional}}</p>
        </v-list-item-content>
      </v-list-item>
    </v-card>
  </v-col>
</template>

<script>
import EventBus from "../event-bus";

export default {
  data() {
    return {
      cart: []
    };
  },
  created() {
    EventBus.$on("send-to-cart", cart => {
      this.cart = cart;
    });
  }
};
</script>

<style>
</style>