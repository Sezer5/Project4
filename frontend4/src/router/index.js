import { createRouter, createWebHistory } from 'vue-router'

const Home = () => import('@/components/Home.vue')
const Product = () => import('@/components/product/Product.vue')

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/productDetail/:slug',
      name: 'productDetail',
      component: Product,
    },
  ],
})

export default router
