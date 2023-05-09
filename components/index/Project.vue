<template>
  <section class="relative">
    <div
      class="absolute inset-0 top-1/2 md:mt-24 lg:mt-0 bg-red-900 pointer-events-none"
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
            class="relative flex flex-col items-center p-6 bg-white rounded shadow-xl"
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
    title: '中州纪元',
    text: '中州纪元是一款国风开放世界 RPG 型 Minecraft 基岩版多人服务器。也是和瑛社主营的项目。',
    icon: icons.icon1,
  },
  {
    title: '自媒体事业',
    text: '我们运营自媒体账号，专注于产出高质量 Minecraft 实况、模组介绍、VR 视频等内容。',
    icon: icons.icon2,
  },
  {
    title: 'MC 服务器运维',
    text: '除中州纪元外，和瑛还运营着和瑛领域、云南大学 Minecraft 服务器、夏纪社区等多个 MC 服务器。',
    icon: icons.icon3,
  },
  {
    title: '航测建模及制图',
    text: '基于我们在 Minecraft 中还原场景的需求，我们衍生出了无人机航测、建模、制图等的业务。',
    icon: icons.icon4,
  },
  {
    title: 'MC 复原型场景设计',
    text: '我们能够在 Minecraft 中复原现实中的场景、建筑、模型等，为古建筑保护、云旅游出一份力。',
    icon: icons.icon5,
  },
  {
    title: 'MC 相关学术研究',
    text: '主要内容包括撰写学术论文、参加各类相关赛事。旨在推动社团学术化建设及促进社员个人全面发展。',
    icon: icons.icon6,
  },
]
</script>
