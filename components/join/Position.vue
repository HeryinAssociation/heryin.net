<template>
  <PublicCarousel
    :contents="content"
    height="100vh"
    class="mt-5 mb-20"
  ></PublicCarousel>
</template>

<script setup lang="ts">
import img1 from 'assets/images/join/position/1.webp'
import img2 from 'assets/images/join/position/2.webp'
import img3 from 'assets/images/join/position/3.webp'
import img4 from 'assets/images/join/position/4.webp'
import img5 from 'assets/images/join/position/5.webp'

const content = [
  {
    title: '文案与策划',
    text: '游戏剧情和设定、自媒体内容策划与文案。',
    img: img1,
  },
  {
    title: '像素艺术设计',
    text: 'Minecraft 相关元素的设计。',
    img: img2,
  },
  {
    title: '环境设计',
    text: 'Minecraft 建筑、地形制作。',
    img: img3,
  },
  {
    title: '视觉传达',
    text: '自媒体内容前期拍摄、后期剪辑、特效。',
    img: img4,
  },
  {
    title: 'Minecraft 开发',
    text: '模组开发、命令方块、数据包等的代码开发。',
    img: img5,
  },
]
</script>
