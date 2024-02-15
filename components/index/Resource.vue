<template>
  <section class="relative">
    <!-- Section background (needs .relative class on parent and next sibling elements) -->
    <div
      class="absolute inset-0 bg-gray-100 pointer-events-none mb-16"
      aria-hidden="true"
    ></div>

    <div id="how-to-work" class="relative max-w-6xl mx-auto px-4 sm:px-6">
      <div class="pt-12 md:pt-20">
        <div class="md:grid md:grid-cols-12 md:gap-6">
          <div
            class="max-w-xl md:max-w-none md:w-full mx-auto md:col-span-7 lg:col-span-6 md:mt-6"
            data-aos="fade-right"
          >
            <div class="md:pr-4 lg:pr-12 xl:pr-16 mb-8">
              <h3 class="h3 mb-3">我们的优势</h3>
              <p class="text-xl text-gray-600">
                在长期的实践和探索中, 和瑛社逐渐形成了独特优势。
              </p>
            </div>
            <div class="mb-8 md:mb-0">
              <button
                v-for="(i, index) in tabContent"
                :key="i.title"
                :class="`flex items-center text-lg p-5 rounded border transition duration-300 ease-in-out mb-3
                  ${
                    currentTab !== index
                      ? 'bg-white shadow-md border-red-200 hover:shadow-lg'
                      : 'bg-red-100 border-transparent'
                  }`"
                @click="
                  (e) => {
                    currentTab = index
                  }
                "
              >
                <div>
                  <div class="font-bold leading-snug tracking-tight mb-1">
                    {{ i.title }}
                  </div>
                  <div class="text-gray-600">
                    {{ i.text }}
                  </div>
                </div>
                <div
                  class="flex justify-center items-center w-8 h-8 bg-white text-red-600 rounded-full shadow shrink-0 ml-3"
                  v-html="i.icon"
                ></div>
              </button>
            </div>
          </div>

          <div
            class="max-w-xl md:max-w-none md:w-full mx-auto md:col-span-5 lg:col-span-6 mb-8 md:mb-0 md:order-1"
            data-aos="zoom-y-out"
          >
            <div
              class="relative flex flex-col text-center lg:text-right overflow-hidden"
            >
              <Transition
                v-for="(i, index) in tabContent"
                :key="i.title"
                class="w-full"
                enter-active-class="transition ease-in-out duration-700 transform order-first"
                enter-from-class="opacity-0 translate-y-16"
                enter-to-class="opacity-100 translate-y-0"
                leave-active-class="transition ease-in-out duration-300 transform absolute"
                leave-from-class="opacity-100 translate-y-0"
                leave-to-class="opacity-0 -translate-y-16"
              >
                <div
                  class="relative inline-flex flex-col"
                  v-show="currentTab == index"
                >
                  <img
                    class="md:max-w-none mx-auto rounded"
                    :src="i.img"
                    width="500"
                    height="375"
                    alt="Tab 03"
                  />
                </div>
              </Transition>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import icons from 'assets/icons/index/resource'
import Tab01 from 'assets/images/index/resource/3.webp'
import Tab02 from 'assets/images/index/resource/1.webp'
import Tab03 from 'assets/images/index/resource/2.webp'

const currentTab = ref(0)

const tabContent = [
  {
    title: '多元化人才网络',
    text: '通过与跨校和行业的合作，聚集了来自各领域的杰出人才，他们涵盖了跨校、跨专业的多元化背景，促进跨域知识和经验交流。',
    icon: icons.moon,
    img: Tab01,
  },
  {
    title: '对接实践前沿',
    text: '在各类双创竞赛、商业实践、技术实战中汇聚了丰富宝贵的经验；同时与行业保持紧密联系，作为开展实践学习的实际指导。',
    icon: icons.thunder,
    img: Tab03,
  },
  {
    title: '坚实的物质保障',
    text: '在商业实践中的收益反哺于实践学习的广泛开展；此外，稳定服务器和高性能工作站；为社团开展技术实践提供平台。',
    icon: icons.arrow,
    img: Tab02,
  },
]
</script>
