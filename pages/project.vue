<template>
  <div
    v-show="!isProjectDetailPage"
    :class="projectListLoaded ? 'opacity-100' : 'opacity-0'"
    class="transition-opacity duration-300 ease-out"
  >
    <ProjectProjects
      class="opacity-0 translate-y-4 transition-all duration-300 ease-out mb-16"
      data-aos="fade-up"
    />
  </div>
  <div
    :class="detailPageLoaded ? 'opacity-100' : 'opacity-0'"
    class="transition-opacity duration-300 ease-out"
  >
    <NuxtPage />
  </div>
</template>

<script setup lang="ts">
import { onMounted, ref, watch } from 'vue'

const route = useRoute()
const isProjectDetailPage = computed(() => {
  return route.path.startsWith('/project/') && route.path !== '/project'
})

const projectListLoaded = ref(true)
const detailPageLoaded = ref(true)

onMounted(() => {
  // console.log('onMounted - isProjectDetailPage:', isProjectDetailPage.value)
  projectListLoaded.value = !isProjectDetailPage.value
  detailPageLoaded.value = true

  const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px',
  }

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.remove('opacity-0', 'translate-y-4')
        observer.unobserve(entry.target)
      }
    })
  }, observerOptions)

  document.querySelectorAll('[data-aos="fade-up"]').forEach((item) => {
    observer.observe(item)
  })
})

watch(
  () => route.path,
  (newPath) => {
    // console.log(
    //   'Route changed:',
    //   newPath,
    //   'isProjectDetailPage:',
    //   isProjectDetailPage.value
    // )
    projectListLoaded.value = !isProjectDetailPage.value
    detailPageLoaded.value = true
  }
)
</script>
