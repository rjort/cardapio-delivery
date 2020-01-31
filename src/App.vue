<template>
  <div>
    <Navbar />
    <MainCard />
    <Content />
  </div>
</template>


<script>
import Navbar from "@/components/Navbar";
import MainCard from "@/components/MainCard";
import Content from "@/components/Content";

export default {
  components: {
    Navbar,
    MainCard,
    Content
  }
};
</script>

<style>
</style>
