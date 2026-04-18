<template>
  <div class="w-full">
    <div class="relative w-full h-full py-3" :class="{ 'is-loading': !isReady }">
      <div
        v-for="(row, rowIndex) in rows"
        :key="rowIndex"
        class="marquee-row"
      >
        <div
          class="marquee-track"
          :style="{ '--duration': `${rowIndex % 2 === 0 ? oddRowDuration : evenRowDuration}s` }"
        >
          <div
            v-for="photo in row"
            :key="photo.id"
            class="rounded-lg overflow-hidden shadow-md transition-all duration-300 hover:shadow-lg hover:scale-105"
          >
            <NuxtImg
              :src="photo.src"
              :alt="photo.alt"
              height="200"
              format="webp"
              quality="70"
              :preload="{ fetchPriority: 'high' }"
              @load="onMediaDone(photo.id)"
              @error="onMediaDone(photo.id)"
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
interface Photo {
  id: string
  src: string
  alt: string
}

// 直接使用 queryContent 获取 memories.md 文件数据
const memoriesData = await queryContent('memories/memories').findOne()

// 处理照片数据
const basePhotos = ref<Photo[]>([])
if (memoriesData && memoriesData.img && Array.isArray(memoriesData.img)) {
  basePhotos.value = memoriesData.img.map((src: string, index: number) => ({
    id: `photo-${index + 1}`,
    src: src,
    alt: `照片-${index + 1}`,
  }))
  // console.log('成功获取 memories 数据:', basePhotos.value)
} else {
  if (process.client) {
    console.warn('没有找到 memories 数据')
  }
}

// console.log('使用的照片数据:', basePhotos.value)

const shuffle = (photos: Photo[]) => {
  const result = [...photos]
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[result[i], result[j]] = [result[j], result[i]]
  }
  return result
}

const rows = ref<Photo[][]>([])
const rowCount = 4
const oddRowDuration = 40
const evenRowDuration = 35
const loadedIds = ref(new Set<string>())
const isReady = ref(false)

const totalImageCount = computed(() =>
  rows.value.reduce((sum, row) => sum + row.length, 0)
)

const onMediaDone = (id: string) => {
  if (loadedIds.value.has(id)) {
    return
  }

  loadedIds.value.add(id)
  if (loadedIds.value.size >= totalImageCount.value) {
    isReady.value = true
  }
}

const buildRows = () => {
  const source = shuffle(basePhotos.value)
  const grouped: Photo[][] = Array.from({ length: rowCount }, () => [])

  source.forEach((photo, index) => {
    grouped[index % rowCount].push(photo)
  })

  rows.value = grouped.map((row, rowIndex) => {
    if (row.length === 0) {
      return []
    }
    const doubled = [...row, ...row]
    return doubled.map((photo, index) => ({
      ...photo,
      id: `${photo.id}-r${rowIndex}-${index}`,
    }))
  })

  loadedIds.value.clear()
  isReady.value = rows.value.length === 0 || totalImageCount.value === 0
}

buildRows()
</script>

<style scoped>
.marquee-row {
  position: relative;
  width: 100%;
  margin-bottom: 0.75rem;
  min-height: 200px;
}

.marquee-track {
  --duration: 24s;
  display: flex;
  align-items: center;
  width: max-content;
  gap: 1rem;
  animation: scroll-left var(--duration) linear infinite;
}

.is-loading .marquee-row {
  visibility: hidden;
}

.is-loading img {
  display: none;
  visibility: hidden;
}

@keyframes scroll-left {
  from {
    transform: translateX(0);
  }
  to {
    transform: translateX(-50%);
  }
}
</style>
