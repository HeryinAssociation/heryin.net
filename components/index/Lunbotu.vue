<template>
  <section class="my-20">
    <PublicCarousel :contents="content" height="100vh" />
  </section>
</template>

<script setup lang="ts">
const content = [
  {
    title: '创意项目',
    text: `融合跨校跨专业创意视角，孵化落地兼具创新与实践的特色项目，让创意转化为实际成果。`,
    img: '/images/index/Lunbotu/1.webp',
  },
  {
    title: '学研实践',
    text: `联动高校科研资源，以社会实践、创新竞赛、学术交流为载体，推动理论知识向实践能力转化，搭建学用结合平台。`,
    img: '/images/index/Lunbotu/2.webp',
  },
  {
    title: '创新创业',
    text: `整合高校、行业资源，提供指导、打磨、资源对接全支持，将创意成果、学研收获转化为商业项目，开展创新创业实践`,
    img: '/images/index/Lunbotu/3.webp',
  },
]
</script>
