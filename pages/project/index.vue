<template>
  <div class="flex flex-col items-center pt-10 pb-10">
    <h1
      class="self-center text-3xl md:text-4xl pb-10"
      style="font-family: 'heryin'"
    >
      项目案例
    </h1>
    <div
      class="card w-11/12 md:w-3/5 lg:1/2 bg-gray-100 shadow-sm hover:shadow-md transition duration-500 ease-in-out m-2"
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

const contentQuery = await queryContent('/project').find()
const list = reactive([] as Article[])
for (const article of contentQuery) {
  // 使用_path来生成正确的链接，避免路径问题
  const contentPath = article._path || ''
  // 从_path中提取项目文件名部分，例如从/project/20240210-yunyoumintu copy提取20240210-yunyoumintu copy
  const slug = contentPath.replace('/project/', '') || ''
  const link = `/project/${slug}`

  // 调试信息
  console.log('Article:', article)
  console.log('_file:', article._file)
  console.log('Generated slug:', slug)
  console.log('Generated link:', link)

  list.push({
    title: article.title || '无标题',
    date: new Date(article.date),
    desc: article.description,
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
