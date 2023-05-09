<template>
  <section class="my-20" id="arial">
    <div class="my-10 mx-6 md:mx-20 text-right" data-aos="fade-left">
      <h2 class="text-4xl md:text-5xl text-primary" style="font-family: Heryin">
        航测建模及制图
      </h2>
      <p class="text-md md:text-xl">
        基于我们在 Minecraft
        中还原场景的需求，我们衍生出了无人机航测、建模、制图等的业务。
      </p>
    </div>

    <PublicCarousel :contents="content" height="75vh" />
  </section>
</template>

<script setup lang="ts">
import Img4Arial0 from 'assets/images/project/4-Arial-0.webp'
import Img4Arial1 from 'assets/images/project/4-Arial-1.webp'
import Img4Arial2 from 'assets/images/project/4-Arial-2.webp'
import Img4Arial3 from 'assets/images/project/4-Arial-3.webp'

const content = [
  {
    img: Img4Arial0,
    title: '保定钟楼',
    text: `图中所示为保定市钟楼的三维扫描模型，由我们的无人机航测团队在 2022 年 12 月拍摄。<br />
    该模型使用大疆 Mavic 3 拍摄，使用Context Capture、Blender 等软件进行制作。`,
  },
  {
    img: Img4Arial1,
    title: '军校广场雕塑',
    text: `图中所示为保定市军校广场中央的雕塑，由我们的无人机航测团队在 2022 年 12 月拍摄。<br />
    该模型使用大疆 Mavic 3 拍摄，使用Context Capture、Blender 等软件进行制作。`,
  },
  {
    img: Img4Arial2,
    title: '保定人民广场纪念碑',
    text: `图中所示为保定市人民广场中央的纪念碑三维扫描模型，由我们的无人机航测团队在 2023 年 1 月拍摄。<br />
    该模型使用大疆 Mavic 3 拍摄，使用Context Capture、Blender 等软件进行制作。`,
  },
  {
    img: Img4Arial3,
    title: '军校广场彩虹门',
    text: `图中所示为保定市军校广场极具标志性的彩虹门，由我们的无人机航测团队在 2023 年 1 月拍摄。<br />
    该模型使用大疆 Mavic 3 拍摄，使用Context Capture、Blender 等软件进行制作。`,
  },
]
</script>
