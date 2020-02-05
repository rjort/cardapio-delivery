<template>
  <v-app>
    <NavBar />
    <v-content>
      <router-view />
    </v-content>
  </v-app>
</template>

<script>
import NavBar from "@/components/NavBar.vue";

export default {
  name: "App",
  components: {
    NavBar
  },

  data: () => ({
    //
  })
};
</script>

<style>
.back {
  background: url("assets/jr-delivery-background.jpg");
  background-size: cover;
  width: 100%;
  height: 100%;
}
</style>