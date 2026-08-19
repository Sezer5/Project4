<template>
  <div class="container">
    <Spinner :isLoading="productStore.isLoading" />

    <div
      v-if="!productStore.isLoading && productStore.productDetail"
      class="card border-0 shadow-lg rounded-5 overflow-hidden product-card"
    >
      <div class="card-body p-4 p-lg-5">
        <div class="row g-5 align-items-center">
          <!-- Görsel Alanı -->
          <div class="col-12 col-lg-6">
            <div
              class="product-image-wrapper position-relative rounded-4 p-4 d-flex align-items-center justify-content-center bg-body-tertiary"
            >
              <span
                class="badge bg-danger position-absolute top-0 start-0 m-4 px-3 py-2 rounded-pill fs-7 fw-semibold tracking-wide"
              >
                POPULAR
              </span>
              <img
                :src="`${BASE_URL}/` + productStore.productDetail?.thumbnail"
                class="img-fluid object-fit-contain product-img"
                :alt="productStore.productDetail?.name"
              />
            </div>
          </div>

          <!-- Ürün Detay Alanı -->
          <div class="col-12 col-lg-6">
            <div class="d-flex flex-column h-100 justify-content-between">
              <!-- Başlık ve Fiyat -->
              <div>
                <div
                  class="d-flex align-items-center justify-content-between mb-2"
                >
                  <span
                    class="badge bg-success-subtle text-success border border-success-subtle px-3 py-1 rounded-pill fw-medium fs-7"
                  >
                    <i class="bi bi-check-circle-fill me-1"></i> In Stock
                  </span>
                </div>

                <h1 class="fw-bold text-dark mb-3 display-6 product-title">
                  {{ productStore.productDetail?.name }}
                </h1>

                <div class="d-flex align-items-baseline mb-4">
                  <span class="fs-1 fw-black text-primary me-3"
                    >${{ productStore.productDetail?.price }}</span
                  >
                </div>

                <hr class="text-secondary opacity-15 my-4" />
              </div>

              <!-- Seçenekler -->
              <div class="vstack gap-4">
                <!-- Renk Seçimi -->
                <div>
                  <div
                    class="d-flex justify-content-between align-items-center mb-2"
                  >
                    <label
                      class="form-label fw-bold text-uppercase fs-7 text-secondary tracking-wider m-0"
                    >
                      Color
                    </label>
                    <span class="text-dark fw-semibold fs-7">{{
                      data.chosenColor || "Select a color"
                    }}</span>
                  </div>
                  <div id="colorsHolder" class="d-flex flex-wrap gap-2">
                    <button
                      v-for="colors in productStore.productDetail?.colors"
                      :key="colors.id"
                      type="button"
                      class="color-btn border-0 rounded-circle d-flex align-items-center justify-content-center transition-all"
                      :style="{ backgroundColor: colors.name }"
                      :class="{
                        'active-color': data.chosenColor === colors.name,
                      }"
                      @click="data.chosenColor = colors.name"
                    >
                      <i
                        v-if="data.chosenColor === colors.name"
                        class="bi bi-check-lg text-white fs-5 drop-shadow"
                      ></i>
                    </button>
                  </div>
                </div>

                <!-- Beden Seçimi -->
                <div>
                  <div
                    class="d-flex justify-content-between align-items-center mb-2"
                  >
                    <label
                      class="form-label fw-bold text-uppercase fs-7 text-secondary tracking-wider m-0"
                    >
                      Size
                    </label>
                    <span class="text-dark fw-semibold fs-7">{{
                      data.chosenSize || "Select a size"
                    }}</span>
                  </div>
                  <div id="sizesHolder" class="d-flex flex-wrap gap-2">
                    <button
                      v-for="sizes in productStore.productDetail?.sizes"
                      :key="sizes.id"
                      type="button"
                      class="btn btn-size fw-semibold rounded-3 transition-all"
                      :class="
                        data.chosenSize === sizes.name
                          ? 'btn-dark shadow'
                          : 'btn-outline-secondary opacity-75'
                      "
                      @click="data.chosenSize = sizes.name"
                    >
                      {{ sizes.name }}
                    </button>
                  </div>
                </div>

                <!-- Miktar ve Aksiyon Butonları -->
                <div class="pt-2">
                  <label
                    class="form-label fw-bold text-uppercase fs-7 text-secondary tracking-wider mb-2"
                  >
                    Quantity
                  </label>

                  <div class="row g-3 align-items-center">
                    <!-- Özel Adet Sayacı -->
                    <div class="col-12 col-sm-4">
                      <div
                        class="input-group quantity-control rounded-3 overflow-hidden border border-secondary-subtle"
                      >
                        <button
                          class="btn btn-light border-0 px-3"
                          type="button"
                          @click="
                            data.chosenQuantity > 1 && data.chosenQuantity--
                          "
                        >
                          <i class="bi bi-dash-lg"></i>
                        </button>
                        <input
                          type="number"
                          v-model.number="data.chosenQuantity"
                          min="1"
                          :max="productStore.productDetail?.quantity"
                          class="form-control border-0 text-center fw-bold bg-light shadow-none"
                        />
                        <button
                          class="btn btn-light border-0 px-3"
                          type="button"
                          @click="
                            data.chosenQuantity <
                              (productStore.productDetail?.quantity || 99) &&
                              data.chosenQuantity++
                          "
                        >
                          <i class="bi bi-plus-lg"></i>
                        </button>
                      </div>
                    </div>

                    <!-- Sepete Ekle ve Favori Butonu -->
                    <div class="col-12 col-sm-8">
                      <div class="d-flex gap-2">
                        <button
                          type="button"
                          class="btn btn-primary btn-lg flex-grow-1 fw-bold rounded-3 shadow-sm d-flex align-items-center justify-content-center gap-2 add-to-cart-btn"
                          :disabled="!data.chosenColor || !data.chosenSize"
                          @click="
                            cartStore.addItemToCart({
                              product_id: productStore.productDetail?.id,
                              slug: productStore.productDetail?.slug,
                              thumbnail: productStore.productDetail?.thumbnail,
                              color: data.chosenColor,
                              size: data.chosenSize,
                              qty: data.chosenQuantity,
                              maxQty: productStore.productDetail?.quantity,
                              price: productStore.productDetail?.price,
                            })
                          "
                        >
                          <i class="bi bi-bag-plus-fill fs-5"></i>
                          <span>Add To Cart</span>
                        </button>

                        <button
                          type="button"
                          class="btn btn-outline-secondary btn-lg rounded-3 px-3 d-flex align-items-center justify-content-center"
                          title="Add to Wishlist"
                        >
                          <i class="bi bi-heart fs-5"></i>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useProductStore } from "@/stores/useProductStore";
import { onMounted, reactive } from "vue";
import { useRoute } from "vue-router";
import { BASE_URL } from "../helpers/config";
import Spinner from "../layouts/Spinner.vue";
import { useCartStore } from "@/stores/useCartStore";

const term = useRoute().params.slug;
const productStore = useProductStore();

const data = reactive({
  chosenColor: null,
  chosenSize: null,
  chosenQuantity: 1,
});

const cartStore = useCartStore();

onMounted(() => {
  productStore.fetchProductDetail(term);
});
</script>

<style scoped>
.fs-7 {
  font-size: 0.825rem;
}

.fw-black {
  font-weight: 800;
}

.tracking-wider {
  letter-spacing: 0.08em;
}

/* Ana Kart */
.product-card {
  background: #ffffff;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.06) !important;
}

/* Görsel Konteyneri */
.product-image-wrapper {
  min-height: 420px;
  transition: all 0.3s ease;
}

.product-img {
  max-height: 360px;
  filter: drop-shadow(0 10px 15px rgba(0, 0, 0, 0.08));
  transition: transform 0.4s ease;
}

.product-image-wrapper:hover .product-img {
  transform: scale(1.05) translateY(-5px);
}

/* Renk Butonları */
.color-btn {
  width: 42px;
  height: 42px;
  cursor: pointer;
  outline: 2px solid transparent;
  outline-offset: 3px;
  box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.15);
}

.color-btn:hover {
  transform: scale(1.1);
}

.color-btn.active-color {
  outline-color: var(--bs-primary);
  transform: scale(1.08);
}

.drop-shadow {
  filter: drop-shadow(0px 2px 3px rgba(0, 0, 0, 0.4));
}

/* Beden Butonları */
.btn-size {
  min-width: 52px;
  height: 44px;
  padding: 0 1rem;
}

.btn-size:hover {
  transform: translateY(-2px);
}

/* Miktar Kontrolü */
.quantity-control {
  height: 48px;
}

.quantity-control input::-webkit-outer-spin-button,
.quantity-control input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Sepete Ekle Butonu */
.add-to-cart-btn {
  height: 48px;
  transition: all 0.2s ease;
}

.add-to-cart-btn:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba(13, 110, 253, 0.3) !important;
}

.transition-all {
  transition: all 0.2s ease-in-out;
}
</style>