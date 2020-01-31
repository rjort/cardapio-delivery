<template>
  <v-app>
		<Navbar />
    <Content />
  </v-app>
</template>

<script>
import Navbar from "@/components/Navbar";
import Content from "@/components/Content";

export default {
  name: "app",
  components: {
		Navbar,
    Content
  }
};
</script>

<style>
</style>
