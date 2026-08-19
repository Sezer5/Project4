import { BASE_URL } from '@/components/helpers/config'
import axios from 'axios'
import { defineStore } from 'pinia'

export const useProductStore = defineStore('counter', {
  state: () => ({ 
    products:[],
    colors:[],
    sizes:[],
    isLoading:false,
    productDetail:null,
   }),
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    async fetchProducts() {
        this.isLoading = true
      try {
        const response = await axios.get(`${BASE_URL}/api/products`)
        this.products = response.data.data
        this.colors = response.data.colors
        this.sizes = response.data.sizes
        this.isLoading = false
      } catch (error) {
        console.log(error)
        this.isLoading = false
      }
    },

    async fetchProductsByColor(color) {
        this.isLoading = true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${color}/color`)
        this.products = response.data.data
        this.colors = response.data.colors
        this.sizes = response.data.sizes
        this.isLoading = false
      } catch (error) {
        console.log(error)
        this.isLoading = false
      }
    },

    async fetchProductsBySize(size) {
        this.isLoading = true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${size}/size`)
        this.products = response.data.data
        this.colors = response.data.colors
        this.sizes = response.data.sizes
        this.isLoading = false
      } catch (error) {
        console.log(error)
        this.isLoading = false
      }
    },

    async fetchProductsByTerm(term) {
        this.isLoading = true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${term}/term`)
        this.products = response.data.data
        this.colors = response.data.colors
        this.sizes = response.data.sizes
        this.isLoading = false
      } catch (error) {
        console.log(error)
        this.isLoading = false
      }
    },

    async fetchProductDetail(product) {
        this.isLoading = true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${product}/product`)
        this.productDetail = response.data.data
        this.isLoading = false
      } catch (error) {
        console.log(error)
        this.isLoading = false
      }
    },

  },
})