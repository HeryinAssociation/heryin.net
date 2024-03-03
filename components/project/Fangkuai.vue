<template>
  <section class="my-20" id="fangkuai">
    <div class="my-10 mx-6 md:mx-20" data-aos="fade-right">
      <h2 class="text-4xl md:text-5xl text-primary" style="font-family: Heryin">
        方块元宇
      </h2>
      <p class="text-md md:text-xl">
        方块元宇是⼀种结合航测技术和体素技术的数字重建新⽅案 <br />
        目前，已在云游闵图项目、南工大、南开、天大、暨大、<br />
        云大等多所高校复原工程成功实践；未来将在数字人文、<br />
        文化创意、数字重建等领域进一步应用。<br />
        <NuxtLink
          to="https://metaconstr.net"
          target="_blank"
          class="link link-primary"
          >前往项目官网了解详情</NuxtLink
        >
      </p>
    </div>

    <PublicCarousel :contents="images" height="100vh" />
  </section>
</template>

<script setup lang="ts">
import Img1Fangkuai0 from 'assets/images/project/1-Fangkuai-0.webp'
import Img1Fangkuai1 from 'assets/images/project/1-Fangkuai-1.webp'
import Img1Fangkuai2 from 'assets/images/project/1-Fangkuai-2.webp'
import Img1Fangkuai3 from 'assets/images/project/1-Fangkuai-3.webp'
import Img1Fangkuai4 from 'assets/images/project/1-Fangkuai-4.webp'
import Img1Fangkuai5 from 'assets/images/project/1-Fangkuai-5.webp'

const images = [
  Img1Fangkuai0,
  Img1Fangkuai1,
  Img1Fangkuai2,
  Img1Fangkuai3,
  Img1Fangkuai4,
  Img1Fangkuai5,
]
</script>
