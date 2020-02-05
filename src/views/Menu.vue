<template>
  <v-container fluid class="back">
    <v-row>
      <CardForm />
      <CardCart />
    </v-row>
  </v-container>
</template>

<script>
// @ is an alias to /src
import CardForm from "@/components/CardForm.vue";
import CardCart from "@/components/CardCart.vue";

export default {
  name: "menu",
  components: {
    CardForm,
    CardCart
  }
};
</script>

<style>
</style>