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
import img6 from 'assets/images/join/position/6.webp'

const content = [
  {
    title: '社区运营部——体素艺术',
    text: 'MC 建筑、地编；Blockbench、MagicalVoxel建模；像素艺术。',
    img: img3,
  },
  {
    title: '数字创意部——创意策划',
    text: '社区研究；管理学、数字人文、数字孪生研究；自媒体策划与文案。',
    img: img1,
  },
  {
    title: '执行委员会——管理行政',
    text: '社团组织工作：人事、团建、招新；企业管理工作：财务、税务、法务等',
    img: img2,
  },

  {
    title: '数字创意部——视觉传达',
    text: 'Blender、D5渲染器、Twinmotion；UE5',
    img: img4,
  },
  {
    title: '技术运维部——研究开发',
    text: '前端、后端开发（JS/Rust/C#/C++/Java等）；MC 模组、服务器插件、数据包、命令方块等开发。',
    img: img5,
  },
  {
    title: '和瑛航空',
    text: '航模、无人机、航空建模与制图、ContextCapture、硬件、摄影。',
    img: img6,
  },
]
</script>
