<template>
  <div class="max-w-7xl mx-auto px-4 sm:px-6">
    <div
      class="grid gap-4 overflow-hidden relative h-[105vh]"
      :style="{
        gridTemplateColumns: `repeat(${currentColumnCount}, 1fr)`,
      }"
      ref="flowGrid"
    >
      <div
        v-for="(column, colIndex) in columns"
        :key="colIndex"
        class="relative overflow-hidden h-full"
        ref="columnRefs"
      >
        <div
          v-for="(photo, photoIndex) in column"
          :key="photo.id"
          class="absolute w-full"
          :style="{
            '--offset': photo.offset + 'px',
            transform: 'translateY(var(--offset))',
          }"
        >
          <div
            class="w-full rounded-lg overflow-hidden shadow-lg transition-all duration-300 hover:shadow-lg hover:-translate-y-1 hover:scale-102"
            :style="{
              height: `${photo.height}px`,
            }"
          >
            <img
              :src="photo.src"
              :alt="photo.alt"
              class="w-full h-full object-cover block"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted, computed } from 'vue'

interface BasePhoto {
  id: string
  src: string
  alt: string
}

interface Photo extends BasePhoto {
  offset: number
  height: number
}

const flowGrid = ref<HTMLElement | null>(null)
const columnRefs = ref<HTMLElement[]>([])
const animationFrameId = ref<number | null>(null)
const currentColumnCount = ref(4)
const visibleHeight = ref(0)

// 直接使用 queryContent 获取 memories.md 文件数据
const memoriesData = await queryContent('memories/memories').findOne()

// 处理照片数据
const basePhotos = ref<BasePhoto[]>([])
if (memoriesData && memoriesData.img && Array.isArray(memoriesData.img)) {
  basePhotos.value = memoriesData.img.map((src: string, index: number) => ({
    id: `photo-${index + 1}`,
    src: src,
    alt: `照片-${index + 1}`,
  }))
  // console.log('成功获取 memories 数据:', basePhotos.value)
} else {
  // console.log('没有找到 memories 数据')
}

// console.log('使用的照片数据:', basePhotos.value)

// 创建一个随机排序的照片数组
const getRandomPhotos = () => {
  const photos = [...basePhotos.value]
  for (let i = photos.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[photos[i], photos[j]] = [photos[j], photos[i]]
  }
  return photos
}

let randomPhotos = ref<BasePhoto[]>(getRandomPhotos())
let photoIndexCounter = 0

const getNextPhoto = (): Photo => {
  // 确保 basePhotos 不为空
  if (basePhotos.value.length === 0) {
    // 返回一个空照片占位符
    return {
      id: `photo-${photoIndexCounter}`,
      src: '',
      alt: `照片-${photoIndexCounter}`,
      offset: 0,
      height: 400,
    }
  }

  // 如果所有随机照片都使用完了，重新生成随机数组
  if (photoIndexCounter >= randomPhotos.value.length) {
    randomPhotos.value = getRandomPhotos()
    photoIndexCounter = 0
  }

  const photo = randomPhotos.value[photoIndexCounter]
  photoIndexCounter++

  // 生成随机高度，范围在300-500px之间
  const randomHeight = Math.floor(Math.random() * 200) + 300

  return {
    ...photo,
    id: `${photo.id}-${photoIndexCounter}`,
    offset: 0,
    height: randomHeight,
  }
}

const columns = ref<Photo[][]>([])

const initColumns = (columnCount: number) => {
  const result: Photo[][] = Array.from({ length: columnCount }, () => [])
  const gap = 20

  for (let i = 0; i < columnCount; i++) {
    let currentOffset = 0
    for (let j = 0; j < 4; j++) {
      const photo = getNextPhoto()
      photo.offset = currentOffset + i * 100
      result[i].push(photo)
      currentOffset += photo.height + gap
    }
  }

  return result
}

const updateColumns = () => {
  const width = window.innerWidth
  let columnCount = 2

  if (width >= 1024) {
    columnCount = 4
  } else if (width >= 640) {
    columnCount = 3
  }

  currentColumnCount.value = columnCount
  columns.value = initColumns(columnCount)

  if (flowGrid.value) {
    visibleHeight.value = flowGrid.value.offsetHeight
  }
}

const animate = () => {
  const speeds = [0.5, 0.6, 0.4, 0.55]
  const gap = 20

  columns.value.forEach((column, colIndex) => {
    const speed = speeds[colIndex % speeds.length]

    column.forEach((photo, index) => {
      photo.offset -= speed

      if (photo.offset < -photo.height) {
        const lastPhoto = column[column.length - 1]
        photo.offset = lastPhoto.offset + lastPhoto.height + gap

        const removedPhoto = column.splice(index, 1)[0]
        column.push(removedPhoto)
      }
    })
  })

  animationFrameId.value = requestAnimationFrame(animate)
}

onMounted(() => {
  updateColumns()
  window.addEventListener('resize', updateColumns)

  if (flowGrid.value) {
    visibleHeight.value = flowGrid.value.offsetHeight
  }
  animationFrameId.value = requestAnimationFrame(animate)
})

onUnmounted(() => {
  window.removeEventListener('resize', updateColumns)
  if (animationFrameId.value !== null) {
    cancelAnimationFrame(animationFrameId.value)
  }
})
</script>
