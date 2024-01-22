<template>
  <section
    class="flex max-w-6xl h-12 md:h-16 mx-auto border-b border-gray-200 transition duration-300 ease-in-out"
  >
    <ul class="flex grow justify-around flex-wrap items-center">
      <li v-for="i in TabBarList" :key="i.name">
        <NuxtLink :to="i.path">
          {{ i.name }}
        </NuxtLink>
      </li>
    </ul>
    <div class=""></div>
  </section>
</template>

<script setup lang="ts">
type tabItem = {
  name: string
  path: string
}

const TabBarList = reactive<tabItem[]>([
  {
    name: '发展历程',
    path: '/about/history',
  },
  {
    name: '成员组成',
    path: '/about/member',
  },
  {
    name: '合作伙伴',
    path: '/about/partner',
  },
])
</script>

<style scoped>
.router-link-active {
  @apply text-red-600;
}
</style>
