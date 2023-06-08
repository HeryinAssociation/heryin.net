<template>
  <div class="flex flex-col items-center py-20">
    <div class="w-11/12 md:w-3/5 lg:1/2">
      <h1
        class="self-start text-primary text-3xl md:text-4xl pt-10 tracking-tighter"
        style="font-family: Heryin"
      >
        {{ page.title }}
      </h1>
      发表于 {{ new Date(page.date).toLocaleDateString() }}
      <hr class="py-2" />
      <ContentDoc
        class="prose max-w-none prose-p:indent-8 prose-h1:hidden prose-a:text-primary prose-a:no-underline hover:prose-a:underline"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
const { page } = useContent()
useContentHead(page)
</script>
