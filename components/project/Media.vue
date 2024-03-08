<template>
  <section class="my-20" id="media">
    <div class="my-10 mx-6 md:mx-20">
      <h2 class="text-4xl md:text-5xl text-primary" style="font-family: Heryin">
        融媒体事业
      </h2>
      <p class="text-md md:text-xl">
        和瑛社完善的视效工作流，丰富多彩的数字创意，
        <br />
        以融媒体事业高质量发展，赋能社区繁荣。
      </p>
    </div>

    <div
      class="flex flex-col md:flex-row mx-20 justify-center gap-x-10 gap-y-10 flex-nowrap"
    >
      <!-- 外层容器，设置为flex布局，列方向排列，中等屏幕尺寸时变为行方向排列。外边距为mx-20（水平方向20）。
        居中对齐，项之间的间隙在x方向上为10，y方向上也为10，且不换行。data-aos-id-team是用于动画的锚点标记。 -->

      <div
        v-for="i in content"
        :key="i.link"
        class="md:w-1/3 py-6 card card-bordered"
      >
        <!-- 内层循环容器，遍历content数组，每个元素命名为i。动态绑定:key为i.link。
          设置在中等屏幕宽度下宽度为容器的三分之一，y方向内边距为6。应用card和card-bordered样式。
          data-aos="zoom-y-out"指定动画效果为沿y轴向外缩放，data-aos-anchor绑定动画触发的锚点。 -->

        <NuxtLink :to="i.link" target="_blank">
          <!-- 使用NuxtLink组件进行路由导航，:to动态绑定到i.link，点击时在新标签页打开链接。 -->

          <div class="flex flex-col items-center">
            <!-- 卡片内容容器，flex布局，列方向排列，子元素居中对齐。 -->

            <!-- <img
              class="rounded-full mb-4"
              :src="i.img"
              width="120"
              height="120"
            /> -->
            <!-- 动态绑定的图片，圆形（rounded-full），下边距mb-4。:src动态绑定到i.img。 -->

            <!-- <div class="text-primary font-medium mb-2">{{ i.platform }}</div> -->
            <!-- 显示i.platform，应用主题色（text-primary），字体为中等粗细，下边距mb-2。 -->

            <img class="mb-4" :src="i.qr" width="500" />
            <!-- 另一动态绑定的图片，用于展示二维码或其他图像，下边距mb-4。:src绑定到i.qr。 -->
            <h4 class="text-xl font-bold mb-1">{{ i.name }}</h4>
            <!-- 使用双大括号插值显示i.name，文本大小为xl，字体加粗，下边距mb-1。 -->
          </div>
        </NuxtLink>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import Img2Media1 from 'assets/images/project/2-Media-1-1.webp'
import Img2Media2 from 'assets/images/project/2-Media-2-1.webp'
import Img2Media3 from 'assets/images/project/2-Media-3-1.webp'
import Qr1 from 'assets/images/project/Arcomua.webp'
import Qr2 from 'assets/images/project/MyUniv.webp'
import Qr3 from 'assets/images/project/MyMotherland.webp'

const content = [
  {
    name: '模组介绍',
    platform: '哔哩哔哩',
    img: Img2Media1,
    qr: Qr1,
    link: 'https://www.bilibili.com/video/BV1Th41137Vt',
  },
  {
    name: '央视网',
    platform: '西瓜视频',
    img: Img2Media2,
    qr: Qr2,
    link: 'https://www.bilibili.com/video/BV12z4y1H7VU',
  },
  {
    name: '高校社区',
    platform: '抖音',
    img: Img2Media3,
    qr: Qr3,
    link: 'https://www.bilibili.com/video/BV1wN411J7rK',
  },
]
</script>
