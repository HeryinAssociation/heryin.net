<template>
  <section class="my-20">
    <PublicCarousel :contents="content" height="100vh" />
  </section>
</template>

<script setup lang="ts">
import Img1Lunbotu0 from 'assets/images/Index/Lunbotu/1.png'
import Img1Lunbotu1 from 'assets/images/Index/Lunbotu/2.png'
import Img1Lunbotu2 from 'assets/images/Index/Lunbotu/3.png'
import Img1Lunbotu3 from 'assets/images/Index/Lunbotu/4.png'

const content = [
  {
    title: '科学研究',
    text: `数字重建体素模型外景`,
    img: Img1Lunbotu0,
  },
  {
    title: '学研实践',
    text: `云大校园复原工程，数字重建项目。`,
    img: Img1Lunbotu1,
  },
  {
    title: '成果转化',
    text: `经过航空制图所得校园数字地表模型和正射影像`,
    img: Img1Lunbotu2,
  },
  {
    title: '组织风采',
    text: `闵行图书馆儿童区数字重建`,
    img: Img1Lunbotu3,
  },
]
</script>
