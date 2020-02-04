<template>
  <div class="home">
      <div class="content">
      <v-container fluid fill-height class="back">
        <v-row>
          <CardForm />
          <CardCart />
        </v-row>
      </v-container>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import CardForm from '@/components/CardForm.vue';
import CardCart from '@/components/CardCart.vue';


export default {
  name: 'home',
  components: {
    CardForm,
    CardCart,
  },
};
</script>

<style>
  .content {
    position: relative;
  }
  .back {
    background: url('../assets/jr-delivery-background.jpg');
    background-size: cover;
    width: 100%;
    height: 100%;
  }
</style>