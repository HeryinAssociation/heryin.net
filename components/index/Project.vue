<template>
  <section class="relative">
    <div
      class="absolute inset-0 top-1/4 md:mt-24 lg:mt-0 bg-red-900 pointer-events-none"
      aria-hidden="true"
    ></div>

    <div class="relative max-w-6xl mx-auto px-4 sm:px-6">
      <div class="py-12 md:py-20">
        <div class="max-w-3xl mx-auto text-center pb-12 md:pb-20">
          <h2 class="h2 mb-4">我们的项目和业务</h2>
          <p class="text-xl text-gray-600">和瑛经营许多项目和业务。</p>
        </div>

        <div
          class="max-w-sm mx-auto grid gap-6 md:grid-cols-2 lg:grid-cols-3 items-start md:max-w-2xl lg:max-w-none"
        >
          <div
            v-for="i in cardContent"
            :key="i.title"
            class="relative flex flex-col items-center p-6 bg-slate-50 rounded shadow-xl"
          >
            <h4 class="text-xl font-bold leading-snug tracking-tight mb-1">
              {{ i.title }}
            </h4>
            <p class="text-gray-600 text-center">
              {{ i.text }}
            </p>
          </div>
        </div>
        <div class="flex justify-center pt-12">
          <NuxtLink
            class="btn text-red-900 bg-white hover:bg-red-100 w-full sm:w-auto sm:ml-4"
            to="/project"
          >
            了解项目
          </NuxtLink>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import icons from 'assets/icons/index/project'

const cardContent = [
  {
    title: '方块元宇',
    text: '我们构成⼀种结合航测和体素建模的数字重建新⽅案，能够较好地胜任数字⼈⽂、数字孪⽣、⽂化创意等特定领域的应⽤需求。',
    icon: icons.icon1,
  },
  {
    title: 'MC 服务器运维',
    text: '我们以公益性和社区性为主要导向，面向广大MC 社区提供服务器运营、托管、技术支援等各类服务。',
    icon: icons.icon2,
  },
  {
    title: '融媒体事业',
    text: '和瑛社完善的视效工作流，丰富多彩的数字创意，以融媒体事业高质量发展，赋能社区繁荣。',
    icon: icons.icon3,
  },
  {
    title: '数字创意',
    text: '我们重视创意驱动，通过各种方式激励创意创造，推动创意-创新-创业的进程',
    icon: icons.icon4,
  },
  {
    title: '体素艺术',
    text: '我们基于体素风格，借助沙盒平台Minecraft，复原现实场景或设计场景。',
    icon: icons.icon5,
  },
  {
    title: '人文研究',
    text: '以社区性为导向主要涵盖输出社区观点、撰写学术论文、参加各类相关赛事。',
    icon: icons.icon6,
  },
]
</script>
