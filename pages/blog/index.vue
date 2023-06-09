<template>
  <div class="flex flex-col items-center pt-24 pb-10">
    <!-- <h1>和瑛博客</h1> -->
    <div
      class="card w-11/12 md:w-3/5 lg:1/2 bg-white shadow-lg hover:shadow-xl transition duration-500 ease-in-out m-4"
      v-for="article in list"
      :key="article.link"
    >
      <NuxtLink :to="article.link">
        <div class="card-body">
          <h2
            class="card-title text-primary text-2xl md:text-3xl leading-tight"
            style="font-family: Heryin"
          >
            {{ article.title }}
          </h2>
          <p class="text-gray-600 text-sm mb-2">
            发表于 {{ article.date.toLocaleDateString() }}
          </p>
          <p>{{ article.desc }}</p>
          <div class="card-actions justify-end">
            <!-- <button class="link link-primary">阅读全文</button> -->
          </div>
        </div>
      </NuxtLink>
    </div>
  </div>
</template>

<script setup lang="ts">
type Article = {
  title: string
  date: Date
  desc: string
  link: string
}

const contentQuery = await queryContent().find()
const list = reactive([] as Article[])
for (const article of contentQuery) {
  list.push({
    title: article.title || '无标题',
    date: new Date(article.date),
    desc: article.description,
    link: article._path || '#',
  })
}
list.sort((a, b) => (a.date > b.date ? -1 : 1))
</script>
