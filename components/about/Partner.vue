<template>
  <div class="flex justify-center">
    <!-- <h1 class="text-3xl md:text-4xl" style="font-family: 'heryin'">合作伙伴</h1> -->
    <!-- <div v-for="partner in list"></div> -->
  </div>
</template>

<script setup lang="ts">
const router = useRouter()

router.push('join')

// type Partner = {
//   name: string
//   info: string
// }

// const contentQuery = await queryContent('', '/partner').find()
// const list = reactive([] as Partner[])
// for (const partner of contentQuery) {
//   list.push({
//     name: partner.title || 'No name',
//     info: partner.info || 'No Info',
//   })
// }
</script>
