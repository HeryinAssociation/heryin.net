<template>
  <div>
    <!-- 无用组件 -->
  </div>
</template>

<script setup lang="ts">
type Member = {
  name: string
  info?: string
  headSrc: string
  index: number
}
type Department = {
  title: string
  description: string
  members: Member[]
}

onMounted(() => {
  useHead({ title: '和瑛社' })
})
</script>
