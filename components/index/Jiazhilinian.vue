<template>
  <!-- 外层容器：相对定位、全宽背景、允许鼠标事件、底部留白 -->
  <!-- 外层容器：相对定位、全宽背景、允许鼠标事件、底部留白 -->
  <section class="relative bg-white pointer-events-auto">
    <div id="how-to-work" class="relative max-w-6xl mx-auto px-4 sm:px-6">
      <div class="pt-12 sm:pt-16 md:pt-20 pb-12 sm:pb-16 md:pb-20">
        <div class="mb-8 px-6 sm:px-10 md:px-0">
          <h3 class="h3 mb-3">我们的价值理念</h3>
          <p class="text-xl text-gray-600">
            在长期的实践和探索中, 和瑛社逐渐形成了具有特色的组织理念。
          </p>
        </div>
        <div class="md:grid md:grid-cols-12 md:gap-6">
          <div
            class="max-w-xl md:max-w-none md:w-full md:col-span-8 lg:col-span-7"
          >
            <div class="mb-8 md:mb-0 md:pr-24 px-6 sm:px-10 md:px-0">
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
            class="max-w-xl md:max-w-none md:w-full mx-auto md:col-span-4 lg:col-span-5 mb-8 md:mb-0 md:order-1"
          >
            <div
              class="relative flex flex-col text-center lg:text-right overflow-hidden px-6 sm:px-10 md:px-0"
              style="height: 500px; width: 500px; max-width: 100%"
            >
              <Transition
                enter-active-class="transition ease-in-out duration-700 transform"
                enter-from-class="opacity-0 translate-y-16"
                enter-to-class="opacity-100 translate-y-0"
                leave-active-class="transition ease-in-out duration-300 transform"
                leave-from-class="opacity-100 translate-y-0"
                leave-to-class="opacity-0 -translate-y-16"
              >
                <div
                  class="absolute inset-0 flex justify-center items-center"
                  :key="currentTab"
                >
                  <img
                    class="md:max-w-none mx-auto rounded h-full object-contain"
                    :src="tabContent[currentTab].img"
                    width="450"
                    height="450"
                    :alt="tabContent[currentTab].title"
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
import icons from '~/assets/icons/index/resource'
import Tab01 from '~/assets/images/index/resource/1.webp'
import Tab02 from '~/assets/images/index/resource/2.webp'
import Tab03 from '~/assets/images/index/resource/3.webp'
import Tab04 from '~/assets/images/index/resource/4.webp'

const currentTab = ref(0)

const tabContent = [
  {
    title: '实践学习',
    text: '实践是认识的基础；学习是深刻的认识过程，和瑛主张以身体力行的具体实践活动引导学习，建设学习型组织。',
    icon: icons.moon,
    img: Tab01,
  },
  {
    title: '以人为本',
    text: '尊重人，关怀人，培养人，发展人；和瑛主张社团建设要有利于成员的全面发展，成果由全体成员共享。',
    icon: icons.thunder,
    img: Tab02,
  },
  {
    title: '创意驱动',
    text: '社团开展工作，发起项目，都要仰赖于全社的创意和智慧。和瑛社鼓励创意，帮助创意落实。',
    icon: icons.arrow,
    img: Tab03,
  },
  {
    title: '社区共创',
    text: '和瑛社发源于社区，发展离不开社区；和瑛社希望团结广大社区，实现资源畅通，多元协作、共同发展。',
    icon: icons.son,
    img: Tab04,
  },
]
</script>
