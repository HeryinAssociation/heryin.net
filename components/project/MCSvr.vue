<template>
  <section class="my-20" id="mcsvr">
    <div class="my-10 mx-6 md:mx-20" data-aos="fade-right">
      <h2 class="text-4xl md:text-5xl text-primary" style="font-family: Heryin">
        MC 服务器运维
      </h2>
      <p class="text-md md:text-xl">
        除中州纪元外，和瑛还运营着和瑛领域、云南大学 Minecraft
        服务器、夏纪社区等多个 MC 服务器。
      </p>
    </div>

    <PublicCarousel :contents="content" prefix="mcsvr" height="75vh" />
  </section>
</template>

<script setup lang="ts">
import Img3MCSvr1 from 'assets/images/project/3-MCSvr-1.webp'
import Img3MCSvr2 from 'assets/images/project/3-MCSvr-2.webp'
import Img3MCSvr3 from 'assets/images/project/3-MCSvr-3.webp'

const content = [
  {
    title: '和瑛领域',
    text: `和瑛领域是和瑛社的官方 Minecraft 服务器，主要用于进行团体协作的工程建设、承办社团大型多人线上活动。<br />
    硬件搭载于十二代英特尔高频处理器，64GB 内存的服务器，配备 100Mbps 低时延带宽。<br />
    软件针对MC游戏机制的特点以及工程建设的需求，定制了优化的 Paper-spigot 服务端，旨在充分保障工程效率。`,
    img: Img3MCSvr1,
  },
  {
    title: '云南大学 MC 服务器',
    text: `云南大学 Minecraft 服务器，是由云南大学学生自主承办，自主运营的 Minecraft 纯净原版服务器。<br />
    服务器使用 paper-spigot 核心，搭载于高性能、高带宽服务器，为玩家提供优质体验。<br />
    服务器创办秉承“会泽百家、至公天下”的精神，旨在促进校内 MC 同好交流、联谊，发展云大高校MC事业。<br />
    2022 年，云大 MC 服务器玩家自主发起了”云南大学 Minecraft 复原计划“。`,
    img: Img3MCSvr2,
  },
  {
    title: '夏纪社区',
    text: `夏纪社区，由和瑛社代理承办的 MC 模组服务器。<br />
    服务器采用 Fabric 服务端，搭载了地毯、机械动力、伊甸星环、农夫乐事、航空航天、死亡细胞等各类趣味模组。<br />
    服务器搭载于高性能高带宽服务器，充分保障玩家游戏体验。`,
    img: Img3MCSvr3,
  },
]
</script>
