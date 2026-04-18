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

const basePhotos = ref<Photo[]>([])

const memoryImageList = [
  '/memoimg/1.webp',
  '/memoimg/2.webp',
  '/memoimg/3.webp',
  '/memoimg/4.webp',
  '/memoimg/5.webp',
  '/memoimg/6.webp',
  '/memoimg/7.webp',
  '/memoimg/8.webp',
  '/memoimg/9.webp',
  '/memoimg/10.webp',
  '/memoimg/11.webp',
  '/memoimg/12.webp',
  '/memoimg/13.webp',
  '/memoimg/14.webp',
  '/memoimg/15.webp',
  '/memoimg/16.webp',
  '/memoimg/17.webp',
  '/memoimg/18.webp',
  '/memoimg/19.webp',
  '/memoimg/20.webp',
  '/memoimg/21.webp',
  '/memoimg/22.webp',
  '/memoimg/23.webp',
  '/memoimg/24.webp',
  '/memoimg/25.webp',
  '/memoimg/26.webp',
  '/memoimg/27.webp',
  '/memoimg/28.webp',
  '/memoimg/29.webp',
  '/memoimg/30.webp',
  '/memoimg/31.webp',
  '/memoimg/32.webp',
  '/memoimg/33.webp',
]

basePhotos.value = memoryImageList.map((src, index) => ({
  id: `photo-${index + 1}`,
  src,
  alt: `照片-${index + 1}`,
}))

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
