<template>
  <v-app-bar
   app
   elevate-on-scroll
   class="overflow-hidden"
   color="amber"
   height="100"
  >
  <div class="logo">
    <router-link to="/">
		  <v-img 
       class="mx-2"
       :src="require('../assets/jr-delivery-logo.png')"
       height="80"
       max-width="110"
       to="/"
      >
      </v-img>
    </router-link>
  </div>
  </v-app-bar>
</template>

<script>
export default {
  name: 'NavBar',
  data: () => ({

  }),
};
</script>

<style>
  .logo {
    margin: auto;
  }
</style>
