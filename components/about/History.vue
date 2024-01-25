<template>
  <div class="w-11/12 md:w-4/5 lg:w-2/3 2xl:w-1/2 m-auto">
    <div class="pb-4 flex flex-col">
      <h1
        class="self-center text-3xl md:text-4xl"
        style="font-family: 'heryin'"
      >
        {{ page.title }}
      </h1>
      <ContentRenderer>
        <ContentRendererMarkdown
          class="max-w-none prose prose-p:indent-0 prose-h1:hidden prose-a:no-underline hover:prose-a:underline"
          :value="page"
        ></ContentRendererMarkdown>
      </ContentRenderer>
    </div>
  </div>
</template>

<script setup lang="ts">
const query = await queryContent('about', 'history').find()
const page = query[0]

onMounted(() => {
  document.title = page.title!
})
</script>
