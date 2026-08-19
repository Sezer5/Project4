<template>
  <div class="p-2 d-flex flex-wrap justify-content-around">
    <Spinner :isLoading="productStore.isLoading" />
    <ProductListItem
      v-for="product in productStore.products"
      :key="product.id"
      :product="product"
    />
  </div>
</template>

<script setup>
import { useProductStore } from "@/stores/useProductStore";
import { onMounted } from "vue";
import ProductListItem from "./ProductListItem.vue";
import Spinner from "../layouts/Spinner.vue";

const productStore = useProductStore();

onMounted(() => {
  productStore.fetchProducts();
});
</script>

<style scoped>
</style>