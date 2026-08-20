import { defineStore } from 'pinia'

import { useToast } from "vue-toastification";
const toast = useToast();



export const useCartStore = defineStore('cart', {
  state: () => ({ 
    cartItems:[],
   }),
   persist: true,
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    addItemToCart(item) {
      let index = this.cartItems.findIndex(product => product.product_id === item.product_id && product.color === item.color && product.size=== item.size)

      if(index!==-1){
        toast.info("Product already inside your cart", {
            timeout: 2000
        });
      }else{
        this.cartItems.push(item);
        toast.success("Product added in to your cart!", {
            timeout: 2000
        });
      }
      
    },

    incrementItemQuantity(item) {
      let index = this.cartItems.findIndex(product => product.product_id === item.product_id && product.color === item.color && product.size=== item.size)
        
        if(this.cartItems[index].qty===item.maxQty){
            toast.info(`Only ${item.maxQty} product on sale!`, {
                timeout: 2000
            });
        }else{
            this.cartItems[index].qty+=1
            toast.success(`Product added successfully`, {
                timeout: 2000
            });
        }
      
      
    },

    decrementItemQuantity(item) {
      let index = this.cartItems.findIndex(product => product.product_id === item.product_id && product.color === item.color && product.size=== item.size)
        
        if(this.cartItems[index].qty===0){
            this.cartItems.filter(product => product.product_id !== item.product_id);
            toast.success(`Product deleted to your cart successfully`, {
                timeout: 2000
            });
        }else{
            this.cartItems[index].qty-=1
        }      
    },

    deleteItemInCart(item){
        
            this.cartItems=this.cartItems.filter(product => product.ref !== item.ref);
            toast.success(`Product deleted to your cart successfully`, {
                timeout: 2000
            });
        
    },

    emptyCart(){
        this.cartItems=[]
    }
  },
})