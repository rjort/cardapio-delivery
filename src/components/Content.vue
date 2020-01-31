<template>
  <v-container class="mx-auto" fluid>
    <v-row>
      <Order />
      <Cart />
    </v-row>
  </v-container>
</template>

<script>
import Cart from './Cart';
import Order from './Order';
export default {
	components: {
		Order,
		Cart
	}
};
</script>

<style>
</style>