<template>
  <div class="flex flex-col items-center py-20">
    <div class="w-11/12 md:w-3/5 lg:1/2">
      <div v-if="page">
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
      <div v-else>
        <h1
          class="self-start text-primary text-3xl md:text-4xl pt-10 tracking-tighter"
          style="font-family: Heryin"
        >
          文档未找到
        </h1>
        <p>抱歉，找不到您请求的项目文档。</p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
// 调试slug参数
const route = useRoute()
console.log('slug route:', route)
console.log('slug params:', route.params)

// 获取slug参数并查询对应的内容文件
const slug = route.params.slug as string[] | undefined
const slugPath = slug ? slug.join('/') : ''
console.log('Slug path:', slugPath)

// 根据slug查询对应的内容文件
// 确保使用正确的路径，避免重复添加/project前缀
console.log('Querying content with slugPath:', slugPath)

// 安全地查询内容，处理可能的错误
let page = null
let error = null

try {
  // findOne() 直接返回找到的文档对象
  page = await queryContent(`/project/${slugPath}`).findOne()
  console.log('Query result (page content):', page)
} catch (err) {
  error = err
  console.error('Error querying content:', err)
}

if (page) {
  useContentHead(page)
}
</script>
