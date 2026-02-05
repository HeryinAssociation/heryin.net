<template>
  <div class="h-[4vh]"></div>
  <div class="w-full h-screen">
    <div class="overflow-hidden relative w-full h-full" ref="flowGrid">
      <div
        v-for="(row, rowIndex) in rows"
        :key="rowIndex"
        class="relative overflow-hidden w-full"
        :style="{
          position: 'absolute',
          top: `${rowIndex * rowHeight}px`,
          left: 0,
          width: '100%',
          height: `${rowHeight - 20}px`,
        }"
        ref="rowRefs"
      >
        <div
          v-for="(photo, photoIndex) in row"
          :key="photo.id"
          class="absolute"
          :style="{
            '--offset': photo.offset + 'px',
            transform: 'translateX(var(--offset))',
            width: `${photo.width}px`,
          }"
        >
          <div
            class="rounded-lg overflow-hidden shadow-lg transition-all duration-300 hover:shadow-lg hover:-translate-y-1 hover:scale-102"
            :style="{
              height: `${photo.height}px`,
              width: `${photo.width}px`,
            }"
          >
            <img
              :src="photo.src"
              :alt="photo.alt"
              class="h-full object-cover block"
              @load="onImageLoad($event, photo)"
            />
          </div>
        </div>
      </div>

      <!-- 下半部分20%的浅灰色渐变覆盖层 -->
      <div
        class="absolute bottom-0 left-0 w-full h-[10%] bg-gradient-to-t from-gray-100 to-transparent pointer-events-none"
      ></div>
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

// 定义Photo接口，添加偏移量、高度和宽度属性
interface Photo extends BasePhoto {
  offset: number
  height: number
  width?: number
}

const flowGrid = ref<HTMLElement | null>(null)
const rowRefs = ref<HTMLElement[]>([])
const animationFrameId = ref<number | null>(null)
const currentRowCount = ref(4)
const visibleHeight = ref(0)
const rowHeight = ref(0)

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
  console.log('成功获取 memories 数据:', basePhotos.value)
} else {
  console.log('没有找到 memories 数据')
}

console.log('使用的照片数据:', basePhotos.value)

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
      height: rowHeight.value - 20,
      width: 300,
    }
  }

  // 如果所有随机照片都使用完了，重新生成随机数组
  if (photoIndexCounter >= randomPhotos.value.length) {
    randomPhotos.value = getRandomPhotos()
    photoIndexCounter = 0
  }

  const photo = randomPhotos.value[photoIndexCounter]
  photoIndexCounter++

  // 高度保持一致，使用动态计算的行高度
  const fixedHeight = rowHeight.value - 20

  return {
    ...photo,
    id: `${photo.id}-${photoIndexCounter}`,
    offset: 0,
    height: fixedHeight,
    width: 300, // 默认宽度，后续会根据图片实际宽高比调整
  }
}

// 图片加载完成后，根据图片宽高比调整容器宽度
const onImageLoad = (event: Event, photo: Photo) => {
  const img = event.target as HTMLImageElement
  if (img.width && img.height) {
    // 计算图片宽高比
    const aspectRatio = img.width / img.height
    // 根据固定高度计算宽度
    const calculatedWidth = photo.height * aspectRatio
    // 更新照片宽度
    photo.width = calculatedWidth
    console.log(
      `图片 ${photo.id} 宽高比: ${aspectRatio.toFixed(
        2
      )}, 计算宽度: ${calculatedWidth.toFixed(0)}px`
    )

    // 重新计算所有行中照片的偏移量，确保间距均匀
    updateRowOffsets()
  }
}

// 更新所有行中照片的偏移量
const updateRowOffsets = () => {
  const gap = 20

  rows.value.forEach((row) => {
    let currentOffset = 0

    row.forEach((photo, index) => {
      // 更新当前照片的偏移量
      photo.offset = currentOffset
      // 计算下一张照片的偏移量
      currentOffset += photo.width! + gap
    })
  })
}

const rows = ref<Photo[][]>([])

const initRows = (rowCount: number) => {
  const result: Photo[][] = Array.from({ length: rowCount }, () => [])
  const gap = 20

  for (let i = 0; i < rowCount; i++) {
    let currentOffset = 0
    for (let j = 0; j < 7; j++) {
      const photo = getNextPhoto()
      photo.offset = currentOffset
      result[i].push(photo)
      currentOffset += photo.width! + gap
    }
  }

  return result
}

const updateRows = () => {
  // 统一保持4行，不根据页面大小调整
  const rowCount = 4

  currentRowCount.value = rowCount

  // 根据屏幕高度动态计算每行高度
  rowHeight.value = Math.floor(window.innerHeight / rowCount)

  rows.value = initRows(rowCount)

  if (flowGrid.value) {
    // 设置 flowGrid 的高度为屏幕高度
    flowGrid.value.style.height = `${window.innerHeight}px`
    visibleHeight.value = window.innerHeight
  }
}

const animate = () => {
  const speeds = [0.5, 0.6, 0.4, 0.55]
  const gap = 20

  rows.value.forEach((row, rowIndex) => {
    const speed = speeds[rowIndex % speeds.length]

    row.forEach((photo, index) => {
      // 让照片向左移动
      photo.offset -= speed

      // 当照片移动到屏幕左侧外时，重置位置到右侧
      if (photo.offset < -photo.width!) {
        // 找到当前行的最后一张照片
        const lastPhoto = row[row.length - 1]
        // 计算新的偏移量，确保与最后一张照片保持正确的间距
        photo.offset = lastPhoto.offset + lastPhoto.width! + gap

        // 将照片从当前位置移除并添加到行的末尾
        const removedPhoto = row.splice(index, 1)[0]
        row.push(removedPhoto)
      }
    })
  })

  animationFrameId.value = requestAnimationFrame(animate)
}

onMounted(() => {
  updateRows()
  window.addEventListener('resize', updateRows)

  if (flowGrid.value) {
    visibleHeight.value = flowGrid.value.offsetHeight
  }
  animationFrameId.value = requestAnimationFrame(animate)
})

onUnmounted(() => {
  window.removeEventListener('resize', updateRows)
  if (animationFrameId.value !== null) {
    cancelAnimationFrame(animationFrameId.value)
  }
})
</script>
