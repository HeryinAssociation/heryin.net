<template>
  <section>
    <PublicCarousel :contents="projectConent" height="100vh" big-title />
  </section>
</template>
<script setup lang="ts">
import Img1Zhongzhou0 from 'assets/images/project/1-Zhongzhou-0.webp'
import Img1fangkuai0 from 'assets/images/project/1-Fangkuai-0.webp'
import Img2Media0 from 'assets/images/project/2-Media-0.webp'
import Img3MCSvr0 from 'assets/images/project/3-MCSvr-0.webp'
import Img4Arial0 from 'assets/images/project/4-Arial-0.webp'

const projectConent = [
  {
    title: '方块元宇',
    text: '方块元宇是⼀种结合航测技术和体素技术的数字重建新⽅案。',
    img: Img1fangkuai0,
    link: '#fangkuai',
  },
  {
    title: '中州纪元',
    text: '中州纪元是一款国风开放世界 Minecraft 基岩版多人 RPG。',
    img: Img1Zhongzhou0,
    link: '#zhongzhou',
  },
  {
    title: '融媒体事业',
    text: '和瑛社完善的视效工作流，丰富多彩的数字创意，赋能融媒体事业高质量发展，在多个平台设置官号。',
    img: Img2Media0,
    link: '#media',
  },
  {
    title: 'MC 服务器运维与托管',
    text: '除中州纪元外，和瑛还运营着和瑛领域、Calibur Pixel、云南大学、南开大学等多个 MC 服务器。',
    img: Img3MCSvr0,
    link: '#mcsvr',
  },
  {
    title: '航测建模及制图',
    text: '基于在 Minecraft 中还原场景的需求，我们衍生出了无人机航测、建模、制图等的业务。',
    img: Img4Arial0,
    link: '#arial',
  },
]
</script>
