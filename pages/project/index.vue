<template>
  <div class="flex flex-col items-center pt-10 pb-10">
    <h1
      class="self-center text-3xl md:text-4xl pb-10"
      style="font-family: 'heryin'"
    >
      项目案例
    </h1>
    <div
      class="w-11/12 md:w-3/5 lg:1/2 bg-gray-100 shadow-sm hover:shadow-md transition duration-500 ease-in-out m-2"
      v-for="article in list"
      :key="article.link"
    >
      <NuxtLink
        :to="article.link"
        class="grid grid-cols-12 md:h-36 sm:h-24 items-center"
      >
        <div class="w-full h-full object-cover overflow-hidden col-span-4">
          <img
            :src="article.cover || '/blogimg/default-cover.webp'"
            alt="项目封面"
            class="object-cover items-center"
          />
        </div>
        <div class="col-span-8 p-2 pl-4 lg:pl-8">
          <h2
            class="text-primary text-xl md:text-2xl"
            style="font-family: Heryin"
          >
            {{ article.title }}
          </h2>
          <p class="text-gray-600 text-sm">
            发表于 {{ article.date.toLocaleDateString() }}
          </p>
          <p class="text-gray-600 text-sm">
            {{ article.desc }}
          </p>
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
  cover: string
}

const contentQuery = await queryContent('/project').find()
const list = reactive([] as Article[])
for (const article of contentQuery) {
  // 使用_path来生成正确的链接，避免路径问题
  const contentPath = article._path || ''
  // 从_path中提取项目文件名部分，例如从/project/20240210-yunyoumintu copy提取20240210-yunyoumintu copy
  const slug = contentPath.replace('/project/', '') || ''
  const link = `/project/${slug}`

  list.push({
    title: article.title || '无标题',
    date: new Date(article.date),
    desc: article.description,
    cover: article.cover || '',
    link: link,
  })
}
list.sort((a, b) => (a.date > b.date ? -1 : 1))

// 调试输出最终的链接
console.log(
  '最终生成的链接列表:',
  list.map((item) => item.link)
)
</script>
