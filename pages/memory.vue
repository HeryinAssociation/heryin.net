<template>
  <div class="min-h-screen bg-gray-100">
    <div class="animate-in fade-in slide-up duration-700"></div>
  </div>
</template>

<script setup lang="ts">
import MemoryMemories from '~/components/memory/Memories.vue'
</script>

<style scoped>
.animate-in {
  animation-fill-mode: both;
}

.fade-in {
  animation-name: fadeIn;
}

.slide-up {
  animation-name: slideUp, fadeIn;
  animation-duration: 0.7s, 0.7s;
  animation-timing-function: ease-out, ease-out;
  animation-delay: 0s, 0s;
  animation-iteration-count: 1, 1;
  animation-direction: normal, normal;
  animation-fill-mode: both, both;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes slideUp {
  from {
    transform: translateY(16px);
  }
  to {
    transform: translateY(0);
  }
}
</style>
