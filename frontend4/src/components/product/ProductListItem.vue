<template>
  <div class="col-md-3 m-2">
    <div class="card product-card border-0 rounded-4 shadow-lg">
      <div class="position-relative">
        <div class="overflow-hidden">
          <img
            :src="`${BASE_URL}/` + product.thumbnail"
            class="card-img-top product-image"
            alt="Product Image"
          />
        </div>
      </div>
      <div class="card-body p-4">
        <h5 class="card-title mb-3 fw-bold">{{ product.name }}</h5>
        <p class="card-text text-muted mb-4">
          {{ product.description.substr(0, 50) }}
        </p>
        <div class="d-flex justify-content-between align-items-center mb-2">
          <div class="d-flex">
            <div
              v-for="color in product.colors"
              :key="color.id"
              :style="{
                backgroundColor: color.name,
                width: '10px',
                height: '10px',
                borderRadius: '10px',
                marginRight: '5px',
              }"
            ></div>
          </div>
          <div class="d-flex">
            <span
              v-for="size in product.sizes"
              :key="size.id"
              style="margin-right: 5px"
              class="badge bg-light text-black border"
              >{{ size.name }}</span
            >
          </div>
        </div>
        <div class="d-flex justify-content-between align-items-center">
          <span class="price">$ {{ product.price }}</span>
          <button class="btn btn-success text-white px-4 py-2 rounded-pill">
            View More
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { BASE_URL } from "../helpers/config";

const props = defineProps({
  product: {
    type: Object,
    required: true,
  },
});
</script>

<style scoped>
</style>