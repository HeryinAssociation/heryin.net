<template>
  <section class="my-20" id="media">
    <div class="my-10 mx-6 md:mx-20 text-right" data-aos="fade-left">
      <h2 class="text-4xl md:text-5xl text-primary" style="font-family: Heryin">
        自媒体事业
      </h2>
      <p class="text-md md:text-xl">
        我们运营自媒体账号，
        <br />
        专注于产出高质量 Minecraft 实况、模组介绍、VR 视频等内容，
        <br />
        目前涉及哔哩哔哩、抖音、西瓜视频三家国内主流视频平台。
      </p>
    </div>

    <div
      class="flex flex-col md:flex-row mx-20 justify-center gap-x-10 gap-y-10 flex-nowrap"
      data-aos-id-team
    >
      <div
        v-for="i in content"
        :key="i.link"
        class="md:w-1/3 py-6 card card-bordered"
        data-aos="zoom-y-out"
        data-aos-anchor="[data-aos-id-team]"
      >
        <NuxtLink :to="i.link" target="_blank">
          <div class="flex flex-col items-center">
            <img
              class="rounded-full mb-4"
              :src="i.img"
              width="120"
              height="120"
            />
            <h4 class="text-xl font-bold mb-1">{{ i.name }}</h4>
            <div class="text-primary font-medium mb-2">{{ i.platform }}</div>
            <img class="mb-4" :src="i.qr" width="120" height="120" />
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
import Qr1 from 'assets/images/project/2-Media-1-2.svg'
import Qr2 from 'assets/images/project/2-Media-2-2.svg'
import Qr3 from 'assets/images/project/2-Media-3-2.webp'

const content = [
  {
    name: '闹钟酱同志',
    platform: '哔哩哔哩',
    img: Img2Media1,
    qr: Qr1,
    link: 'https://space.bilibili.com/59979451',
  },
  {
    name: '夏天芜Sylvia',
    platform: '西瓜视频',
    img: Img2Media2,
    qr: Qr2,
    link: 'https://www.ixigua.com/home/4204994269550695',
  },
  {
    name: '夏天芜Sylvia',
    platform: '抖音',
    img: Img2Media3,
    qr: Qr3,
    link: 'https://www.douyin.com/user/MS4wLjABAAAAo1AxC5H3YiXW3VnO-_19midx5LJ_z5MMgdD63Wws3OuigPmYBdpTDfxR07xuV3EF',
  },
]
</script>
