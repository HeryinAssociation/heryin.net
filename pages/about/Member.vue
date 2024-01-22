<template>
  <div class="flex justify-center">
    <h1 class="text-5xl" style="font-family: 'heryin'">成员组成</h1>
    <div v-for="member in list"></div>
  </div>
</template>

<script setup lang="ts">
type Member = {
  name: string
  info: string
}

const contentQuery = await queryContent('', '/member').find()
const list = reactive([] as Member[])
for (const member of contentQuery) {
  list.push({
    name: member.title || 'No name',
    info: member.info || 'No Info',
  })
}
</script>
