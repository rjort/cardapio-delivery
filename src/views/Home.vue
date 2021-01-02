<template>
  <v-container class="back d-flex justify-center" fluid>
    <v-row align="center">
      <v-col class="text-center" cols="12" sm="12">
        <div class="my-5">
          <v-btn x-large width="365" to="/menu" color="orange darken-3">Fazer Pedido</v-btn>
        </div>
        <div>
          <v-btn x-large width="365" href="tel://5575998943730" color="green">Ligar</v-btn>
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "home"
};
</script>

<style>
</style>