<template>
  <div class="w-full py-12 sm:py-16 md:py-20 lg:py-24 bg-gray-50">
    <div class="container mx-auto px-4">
      <div class="flex flex-col lg:flex-row items-center gap-8 lg:gap-12">
        <!-- 左侧：地图和动态元素 -->
        <div class="w-full lg:w-3/5 relative">
          <div
            class="relative w-full h-[300px] sm:h-[350px] md:h-[450px] lg:h-[550px] xl:h-[600px]"
          >
            <!-- 中国地图 -->
            <div class="absolute inset-0 flex items-center justify-center">
              <img
                src="/svg/China-outline.svg"
                alt="中国地图"
                class="w-full h-full max-h-3/4 object-contain animate-pulse-slow"
              />
            </div>

            <!-- 动态图标容器 -->
            <div class="absolute inset-0" ref="animationContainer">
              <!-- 连接线 -->
              <svg
                class="absolute inset-0 w-full h-full pointer-events-none"
                viewBox="0 0 100 100"
                preserveAspectRatio="none"
              >
                <line
                  v-for="(connection, index) in connections"
                  :key="index"
                  :x1="parseFloat(connection.from.left)"
                  :y1="parseFloat(connection.from.top)"
                  :x2="parseFloat(connection.to.left)"
                  :y2="parseFloat(connection.to.top)"
                  stroke="#f3f4f6"
                  stroke-width="0.2"
                  stroke-dasharray="0.5,0.5"
                />
              </svg>

              <!-- 科研图标 -->
              <div
                v-for="(icon, index) in icons"
                :key="index"
                class="absolute"
                :style="{
                  left: icon.left,
                  top: icon.top,
                  transform: 'translate(-50%, -50%)',
                  animation: `float ${icon.duration}s ease-in-out infinite`,
                  animationDelay: `${index * 0.5}s`,
                }"
              >
                <div
                  class="icon-container w-[30px] h-[30px] rounded-full bg-white shadow-lg flex items-center justify-center cursor-pointer"
                >
                  <div class="text-blue-600 text-sm">
                    {{ getIconEmoji(icon.type) }}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- 右侧：图文内容 -->
        <div class="w-full lg:w-2/5 px-16 lg:px-0">
          <h2
            class="text-md sm:text-xl md:text-2xl font-bold text-gray-900 mb-4 sm:mb-6"
          >
            我们的成员遍及全国
          </h2>
          <p
            class="text-base sm:text-lg text-gray-600 mb-6 sm:mb-8 leading-relaxed"
          >
            我们的成员遍及全国，联结各地，横跨多学科、多专业领域，形成高效的协作体系；依托完善的成员布局，与各高校及行业相关主体建立广泛且紧密的联结，为多方交流与合作筑牢基础。
          </p>
          <ul class="space-y-3 sm:space-y-4">
            <li class="flex items-start gap-3">
              <div
                class="mt-1 w-5 h-5 sm:w-6 sm:h-6 rounded-full bg-red-100 flex items-center justify-center flex-shrink-0"
              >
                <span class="text-red-600 font-semibold text-sm sm:text-base"
                  >✓</span
                >
              </div>
              <span class="text-gray-700 text-sm sm:text-base"
                >全国高校覆盖，成员背景多元</span
              >
            </li>
            <li class="flex items-start gap-3">
              <div
                class="mt-1 w-5 h-5 sm:w-6 sm:h-6 rounded-full bg-red-100 flex items-center justify-center flex-shrink-0"
              >
                <span class="text-red-600 font-semibold text-sm sm:text-base"
                  >✓</span
                >
              </div>
              <span class="text-gray-700 text-sm sm:text-base"
                >跨专业、跨领域的协作体系</span
              >
            </li>
            <li class="flex items-start gap-3">
              <div
                class="mt-1 w-5 h-5 sm:w-6 sm:h-6 rounded-full bg-red-100 flex items-center justify-center flex-shrink-0"
              >
                <span class="text-red-600 font-semibold text-sm sm:text-base"
                  >✓</span
                >
              </div>
              <span class="text-gray-700 text-sm sm:text-base"
                >广泛、深度的社会联系</span
              >
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>

// 图标配置
const icons = [
  { type: 'science', left: '65%', top: '45%', duration: 6 },
  { type: 'instrument', left: '70%', top: '68%', duration: 8 },
  { type: 'tech', left: '30%', top: '60%', duration: 7 },
  { type: 'data', left: '64%', top: '55%', duration: 9 },
  { type: 'research', left: '40%', top: '40%', duration: 5 },
  { type: 'lab', left: '50%', top: '75%', duration: 10 },
  { type: 'data', left: '73%', top: '33%', duration: 10 },
]

// 计算连接线
const connections = computed(() => {
  const lines = []
  // 连接所有图标，形成一个网络
  for (let i = 0; i < icons.length; i++) {
    for (let j = i + 1; j < icons.length; j++) {
      lines.push({
        from: icons[i],
        to: icons[j],
      })
    }
  }
  return lines
})

// 将百分比位置转换为像素位置
const getPixelPosition = (percentage: string, containerSize: number) => {
  return (parseFloat(percentage) / 100) * containerSize
}

// 计算两个点之间的距离
const getDistance = (
  point1: { left: string; top: string },
  point2: { left: string; top: string }
) => {
  const x1 = parseFloat(point1.left)
  const y1 = parseFloat(point1.top)
  const x2 = parseFloat(point2.left)
  const y2 = parseFloat(point2.top)
  return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2))
}

// 计算两个点之间的角度
const getAngle = (
  point1: { left: string; top: string },
  point2: { left: string; top: string }
) => {
  const x1 = parseFloat(point1.left)
  const y1 = parseFloat(point1.top)
  const x2 = parseFloat(point2.left)
  const y2 = parseFloat(point2.top)
  return (Math.atan2(y2 - y1, x2 - x1) * 180) / Math.PI
}

// 获取图标emoji
const getIconEmoji = (type: string) => {
  switch (type) {
    case 'science':
      return '🔬'
    case 'instrument':
      return '🧪'
    case 'tech':
      return '💻'
    case 'data':
      return '📊'
    case 'lab':
      return '⚗️'
    case 'research':
      return '🔍'
    default:
      return '🔬'
  }
}

onMounted(() => {
  // 组件挂载后的初始化逻辑
})
</script>

<style scoped>
/* 漂浮动画 */
@keyframes float {
  0%,
  100% {
    transform: translateY(0) rotate(0deg);
  }
  25% {
    transform: translateY(-15px) rotate(2deg);
  }
  50% {
    transform: translateY(-10px) rotate(0deg);
  }
  75% {
    transform: translateY(-15px) rotate(-2deg);
  }
}

/* 鼠标悬停动画 */
.icon-container:hover {
  transform: scale(1.1);
  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1),
    0 10px 10px -5px rgba(0, 0, 0, 0.04);
  transition: all 0.3s ease;
}

/* 地图动画 */
@keyframes pulse {
  0%,
  100% {
    opacity: 1;
    transform: scale(1);
  }
  50% {
    opacity: 0.8;
    transform: scale(1.02);
  }
}

/* 缓慢脉冲动画 */
@keyframes pulse-slow {
  0%,
  100% {
    opacity: 1;
    transform: scale(1);
  }
  50% {
    opacity: 0.9;
    transform: scale(1.01);
  }
}

.animate-pulse-slow {
  animation: pulse-slow 4s ease-in-out infinite;
}
</style>
