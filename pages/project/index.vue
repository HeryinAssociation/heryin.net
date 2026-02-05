<template>
  <div class="flex flex-col items-center pt-10 pb-10 px-2 md:px-0">
    <!-- 标题保持原有字体和样式，增加底部装饰线提升层次感 -->
    <h1
      class="self-center text-3xl md:text-4xl pb-10 mb-4"
      style="font-family: 'heryin'"
    >
      项目案例
      <span class="block w-24 h-1 bg-primary mx-auto mt-2 rounded-full"></span>
    </h1>

    <!-- 卡片列表容器：增加统一间距，优化响应式适配 -->
    <div class="w-full max-w-5xl">
      <div
        class="w-full bg-gray-100 shadow-sm hover:shadow-lg transition-all duration-500 ease-out m-3 rounded-xl overflow-hidden hover:-translate-y-1 mb-6 opacity-0 translate-y-4 transition-all duration-700 ease-out"
        v-for="article in list"
        :key="article.link"
        data-aos="fade-up"
      >
        <NuxtLink
          :to="article.link"
          class="grid grid-cols-12 h-full md:h-40 sm:h-32 items-center"
        >
          <!-- 图片容器：优化圆角、尺寸和溢出处理，避免图片变形 -->
          <div class="col-span-4 h-full rounded-l-xl overflow-hidden">
            <img
              :src="article.cover || '/blogimg/default-cover.webp'"
              alt="项目封面"
              class="w-full h-full object-cover transition-transform duration-700 hover:scale-105"
            />
          </div>

          <!-- 文字区域：优化内边距、行高和间距，提升可读性 -->
          <div
            class="col-span-8 p-4 md:p-6 lg:px-8 flex flex-col justify-center h-full"
          >
            <h2
              class="text-primary text-xl md:text-2xl mb-2"
              style="font-family: Heryin"
            >
              {{ article.title }}
            </h2>
            <p class="text-gray-600 text-sm mb-1">
              发表于 {{ article.date.toLocaleDateString() }}
            </p>
            <p class="text-gray-600 text-sm line-clamp-2 leading-relaxed">
              {{ article.desc }}
            </p>
          </div>
        </NuxtLink>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { onMounted } from 'vue'

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

  document.querySelectorAll('.w-full.bg-gray-100').forEach((item) => {
    observer.observe(item)
  })
})
</script>
