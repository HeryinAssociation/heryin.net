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
}

// 辅助函数：从字符串中提取第一张图片的URL
function extractFirstImageUrl(content: string): string {
  if (!content || typeof content !== 'string') {
    console.error('内容为空或不是字符串:', typeof content, content)
    return ''
  }

  // 尝试正则表达式匹配 - 修复Markdown图片格式错误（缺少]括号）
  // 支持正常格式：![alt](url) 和错误格式：![alt(url)
  const imgRegex = /!\[(?:[^\]]*|)\]?\(([^)]+)\)/i
  const match = content.match(imgRegex)
  if (match && match[1]) {
    console.log('正则匹配到图片URL:', match[1])
    return match[1]
  }

  // 如果正则失败，尝试手动查找 - 修复缺少]括号的情况
  const altStart = content.indexOf('![')
  if (altStart !== -1) {
    // 查找(的位置，无论是否有]括号
    const urlStart = content.indexOf('(', altStart)
    if (urlStart !== -1) {
      // 查找)的位置
      const urlEnd = content.indexOf(')', urlStart)
      if (urlEnd !== -1) {
        // 提取URL
        const imgUrl = content.substring(urlStart + 1, urlEnd).trim()
        console.log('手动提取到图片URL:', imgUrl)
        return imgUrl
      }
    }
  }

  console.error('未找到任何图片URL')
  return ''
}

// 辅助函数：基于项目路径生成默认图片URL
function generateDefaultImageUrl(projectPath: string): string {
  // 从路径中提取项目标识
  const projectId = projectPath.split('/').pop() || ''

  // 构建默认图片路径
  // 根据用户提供的示例格式：/blogimg/20230210-zhengrongdeyinian/1/b.webp
  const defaultUrl = `/blogimg/${projectId}/1/b.webp`
  console.log('生成默认图片URL:', defaultUrl)

  return defaultUrl
}

// 先获取项目文件的基本信息
const projectFiles = (await queryContent('/project')
  .sort({ date: -1 })
  .find()) as unknown as ProjectFile[]

// 处理项目数据
const projectContent = []
for (const file of projectFiles) {
  console.log('=== 处理项目 ===')
  console.log('项目信息:', file)

  let imgUrl = ''
  let title = file.title || '无标题项目'
  let description = file.description || ''

  try {
    // 直接使用默认图片URL生成方式，因为我们已经知道图片路径模式
    // Markdown中的图片路径格式为: /blogimg/{projectId}/1/b.webp
    // 从文件路径中提取项目ID
    const projectId = file._path.split('/').pop() || ''
    imgUrl = `/blogimg/${projectId}/1/b.webp`
    console.log('直接生成图片URL:', imgUrl)

    // 额外尝试获取文件内容，用于提取标题（如果需要）
    const fullFile = await queryContent(file._path).findOne()
    if (fullFile?.body && !title) {
      const bodyStr =
        typeof fullFile.body === 'string'
          ? fullFile.body
          : JSON.stringify(fullFile.body)
      const titleMatch = bodyStr.match(/^#\s+(.*)$/m)
      if (titleMatch) {
        title = titleMatch[1]
        console.log('从内容中提取标题:', title)
      }
    }
  } catch (error) {
    console.error('处理文件时出错:', error)
    // 使用默认图片URL作为最终 fallback
    imgUrl = generateDefaultImageUrl(file._path)
  }

  console.log('处理结果 - 标题:', title)
  console.log('处理结果 - 图片URL:', imgUrl)

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
