<template>
  <div>
    <JoinHero
      class="opacity-0 translate-y-4 transition-all duration-300 ease-out"
      data-aos="fade-up"
    />
    <JoinQoute
      class="opacity-0 translate-y-4 transition-all duration-300 ease-out"
      data-aos="fade-up"
    />
    <IndexLunbotu
      class="opacity-0 translate-y-4 transition-all duration-300 ease-out"
      data-aos="fade-up"
    />
    <JoinQoute2
      class="opacity-0 translate-y-4 transition-all duration-300 ease-out"
      data-aos="fade-up"
    />
    <JoinSummary
      class="opacity-0 translate-y-4 transition-all duration-300 ease-out"
      data-aos="fade-up"
    />
  </div>
</template>

<script setup lang="ts">
import { onMounted } from 'vue'

onMounted(() => {
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
</script>
