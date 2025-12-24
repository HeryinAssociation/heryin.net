<template>
  <section>
    <PublicCarousel :contents="projectContent" height="100vh" small-title />
  </section>
</template>
<script setup lang="ts">
// 为项目文件定义类型
interface ProjectFile {
  _path: string
  _file: string
  title?: string
  description?: string
  date?: string
  cover?: string
}

// 先获取项目文件的基本信息，只获取最新的四篇
const projectFiles = (await queryContent('/project')
  .sort({ date: -1 })
  .limit(4)
  .find()) as unknown as ProjectFile[]

// 处理项目数据
const projectContent = []
for (const file of projectFiles) {
  console.log('=== 处理项目 ===')
  console.log('项目信息:', file)

  let imgUrl = file.cover || ''
  let title = file.title || '无标题项目'
  let description = file.description || ''

  // 使用已有的_path作为链接
  const link = file._path || '#'

  projectContent.push({
    title,
    text: description,
    img: imgUrl,
    link,
  })
}
</script>
