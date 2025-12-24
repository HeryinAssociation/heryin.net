<template>
  <div v-if="!isProjectDetailPage">
    <ProjectProjects />
  </div>
  <div>
    <NuxtPage />
  </div>
</template>

<script setup lang="ts">
const route = useRoute()
const isProjectDetailPage = computed(() => {
  return route.path.startsWith('/project/') && route.path !== '/project'
})
</script>
