<template>
  <!-- 组织发展历程 时间线Section -->
  <section class="development-timeline max-w-6xl mx-auto px-5 sm:px-6">
    <!-- 标题 -->
    <div
      id="proser"
      class="prose-headings:font-heryin prose-headings:text-center prose-headings:my-4 prose-h1:text-3xl prose-h1:md:text-4xl prose-h2:text-2xl prose-h2:md:text-3xl prose-p:my-2 prose-a:text-red-800"
    >
      <h1>组织发展历程</h1>
    </div>

    <!-- 时间线容器 -->
    <div class="timeline-container relative pl-10">
      <!-- 时间线竖线 -->
      <div class="absolute top-0 left-3 w-0.5 h-full bg-gray-200 z-10"></div>

      <!-- 时间线节点1：初创期 -->
      <div
        class="timeline-item relative mb-10 pl-8 opacity-0 translate-y-4 transition-all duration-700 ease-out"
        data-aos="fade-left"
        data-aos-delay="100"
      >
        <!-- 节点圆点 -->
        <div
          class="absolute top-0 left-[-40px] w-6 h-6 rounded-full bg-red-600 border-4 border-red-100 z-20 flex items-center justify-center"
        >
          <div class="w-2 h-2 rounded-full bg-white animate-pulse"></div>
        </div>
        <!-- 年份 -->
        <h3 class="text-xl font-semibold text-red-600 mb-2">20XX年</h3>
        <!-- 阶段标题 -->
        <h4 class="text-lg font-semibold text-gray-800 mb-3">
          组织初创 · 核心团队组建
        </h4>
        <!-- 发展描述 -->
        <p class="text-gray-600 leading-relaxed max-w-3xl">
          正式成立XX组织/社团，确定核心发展宗旨与业务方向，完成初始团队搭建，制定首个年度发展规划，开启组织初步运营。
        </p>
      </div>

      <!-- 时间线节点2：成长期 -->
      <div
        class="timeline-item relative mb-10 pl-8 opacity-0 translate-y-4 transition-all duration-700 ease-out"
        data-aos="fade-left"
        data-aos-delay="200"
      >
        <div
          class="absolute top-0 left-[-40px] w-6 h-6 rounded-full bg-red-600 border-4 border-red-100 z-20 flex items-center justify-center"
        >
          <div class="w-2 h-2 rounded-full bg-white animate-pulse"></div>
        </div>
        <h3 class="text-xl font-semibold text-red-600 mb-2">20XX年</h3>
        <h4 class="text-lg font-semibold text-gray-800 mb-3">
          业务拓展 · 团队规模扩大
        </h4>
        <p class="text-gray-600 leading-relaxed max-w-3xl">
          新增XX业务板块/活动项目，完成团队扩招至XX人，建立部门分工体系（如策划部、执行部、宣传部），成功举办首场品牌活动，积累初期核心资源。
        </p>
      </div>

      <!-- 时间线节点3：发展期 -->
      <div
        class="timeline-item relative mb-10 pl-8 opacity-0 translate-y-4 transition-all duration-700 ease-out"
        data-aos="fade-left"
        data-aos-delay="300"
      >
        <div
          class="absolute top-0 left-[-40px] w-6 h-6 rounded-full bg-red-600 border-4 border-red-100 z-20 flex items-center justify-center"
        >
          <div class="w-2 h-2 rounded-full bg-white animate-pulse"></div>
        </div>
        <h3 class="text-xl font-semibold text-red-600 mb-2">20XX年</h3>
        <h4 class="text-lg font-semibold text-gray-800 mb-3">
          体系完善 · 品牌影响力提升
        </h4>
        <p class="text-gray-600 leading-relaxed max-w-3xl">
          制定标准化运营管理制度，搭建线上宣传矩阵，与XX机构/组织建立合作关系，年度活动参与人数突破XX，成为区域内具有一定影响力的XX类组织。
        </p>
      </div>

      <!-- 时间线节点4：成熟期 -->
      <div
        class="timeline-item relative pl-8 opacity-0 translate-y-4 transition-all duration-700 ease-out"
        data-aos="fade-left"
        data-aos-delay="400"
      >
        <div
          class="absolute top-0 left-[-40px] w-6 h-6 rounded-full bg-red-700 border-4 border-red-100 z-20 flex items-center justify-center"
        >
          <div class="w-2 h-2 rounded-full bg-white animate-pulse"></div>
        </div>
        <h3 class="text-xl font-semibold text-red-700 mb-2">20XX年-至今</h3>
        <h4 class="text-lg font-semibold text-gray-800 mb-3">
          创新升级 · 持续稳健发展
        </h4>
        <p class="text-gray-600 leading-relaxed max-w-3xl">
          迭代核心业务与活动形式，打造XX特色品牌项目，团队规模稳定在XX人，形成成熟的人才培养与运营体系，持续推动行业/领域内的交流与发展，规划未来XX年发展蓝图。
        </p>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* 自定义动画 */
@keyframes pulse {
  0%,
  100% {
    opacity: 1;
    transform: scale(1);
  }
  50% {
    opacity: 0.7;
    transform: scale(1.2);
  }
}

.animate-pulse {
  animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
}

/* 响应式调整 */
@media (max-width: 640px) {
  .development-timeline h2 {
    font-size: 1.75rem;
  }

  .timeline-item h3 {
    font-size: 1.25rem;
  }

  .timeline-item h4 {
    font-size: 1.125rem;
  }

  .timeline-item p {
    font-size: 0.875rem;
  }
}
</style>

<script setup lang="ts">
// 导入必要的模块
import { onMounted } from 'vue'

// 滚动动画效果
onMounted(() => {
  const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px',
  }

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.remove('opacity-0', 'translate-y-4')
        observer.unobserve(entry.target)
      }
    })
  }, observerOptions)

  // 观察所有时间线项目
  document.querySelectorAll('.timeline-item').forEach((item) => {
    observer.observe(item)
  })
})
</script>
