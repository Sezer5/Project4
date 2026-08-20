<template>
  <div>
    <div class="p-2 d-flex flex-wrap justify-content-around">
      <Spinner :isLoading="productStore.isLoading" />
      <ProductListItem
        v-for="product in productStore.products.slice(0, data.showItem)"
        :key="product.id"
        :product="product"
      />
    </div>
    <div
      class="align-middle text-center"
      v-if="data.showItem <= productStore.products.length"
    >
      <button class="btn btn-dark" @click="data.showItem += 2">
        <i class="bi bi-arrow-clockwise"></i> Load More
      </button>
    </div>
  </div>
</template>

<script setup>
import { useProductStore } from "@/stores/useProductStore";
import { onMounted, reactive } from "vue";
import ProductListItem from "./ProductListItem.vue";
import Spinner from "../layouts/Spinner.vue";

const productStore = useProductStore();

const data = reactive({
  showItem: 2,
});

onMounted(() => {
  productStore.fetchProducts();
});
</script>

<style scoped>
</style>