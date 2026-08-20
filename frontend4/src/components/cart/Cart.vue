<template>
  <div class="mt-2">
    <div v-if="cartStore.cartItems.length > 0">
      <table class="table table-bordered text-center align-middle">
        <thead>
          <tr>
            <th>*</th>
            <th>Product</th>
            <th>Color</th>
            <th>Size</th>
            <th>Quantity</th>
            <th>Price</th>

            <th>SubTotal</th>
            <th>
              <i
                class="bi bi-trash text-danger"
                style="cursor: pointer"
                @click="cartStore.emptyCart()"
              ></i>
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(items, key) in cartStore.cartItems" :key="items.id">
            <td>{{ (key += 1) }}</td>
            <td><img :src="`${BASE_URL}/` + items.thumbnail" width="30" /></td>
            <td>{{ items.color }}</td>
            <td>{{ items.size }}</td>
            <td>
              <i
                class="bi bi-caret-up-fill"
                style="cursor: pointer"
                @click="cartStore.incrementItemQuantity(items)"
              ></i>
              {{ items.qty }}
              <i
                class="bi bi-caret-down-fill"
                style="cursor: pointer"
                @click="cartStore.decrementItemQuantity(items)"
              ></i>
            </td>
            <td>$ {{ items.price }}</td>
            <td>$ {{ (items.price * items.qty).toFixed(2) }}</td>
            <td>
              <i
                class="bi bi-trash"
                style="cursor: pointer"
                @click="cartStore.deleteItemInCart(items)"
              ></i>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="alert alert-info text-center">
      <i class="bi bi-exclamation-triangle"></i> Empty Your Cart!
    </div>
  </div>
</template>

<script setup>
import { useCartStore } from "@/stores/useCartStore";
import { BASE_URL } from "../helpers/config";

const cartStore = useCartStore();
</script>

<style scoped></style>