<template>
  <!-- 组织发展历程 时间线Section -->
  <section class="development-timeline max-w-6xl mx-auto px-5 sm:px-6">
    <!-- 标题 -->
    <div
      id="proser"
      class="prose-headings:font-heryin prose-headings:text-center prose-headings:my-4 prose-h1:text-3xl prose-h1:md:text-4xl prose-h2:text-2xl prose-h2:md:text-3xl prose-p:my-2 prose-a:text-red-800 mb-10"
    >
      <h1>和瑛系年</h1>
    </div>

    <!-- 时间线容器 -->
    <div class="timeline-container relative pl-10 ml-20">
      <!-- 时间线竖线 -->
      <div class="absolute top-0 left-3 w-0.5 h-full bg-gray-200 z-10"></div>

      <!-- 循环渲染时间线项目 -->
      <div
        v-for="(item, index) in timelineData"
        :key="item.id"
        class="timeline-item relative pl-8 min-h-36 opacity-0 translate-y-4 transition-all duration-700 ease-out"
        :class="{
          'mb-10': true,
          'md:mb-0': item.image,
        }"
        data-aos="fade-left"
        :data-aos-delay="item.delay"
      >
        <!-- 节点圆点 -->
        <div
          class="absolute top-0 left-[-40px] w-6 h-6 rounded-full border-4 border-red-100 z-20 flex items-center justify-center"
          :class="item.isLast ? 'bg-red-700' : 'bg-red-600'"
        >
          <div class="w-2 h-2 rounded-full bg-white animate-pulse"></div>
        </div>

        <!-- 左右布局容器 -->
        <div class="flex flex-col md:flex-row gap-6 md:gap-8 h-full">
          <!-- 左侧内容 -->
          <div class="flex-1">
            <!-- 年份 -->
            <h3
              class="text-xl font-semibold mb-2"
              :class="item.isLast ? 'text-red-700' : 'text-red-600'"
            >
              {{ item.year }}
            </h3>
            <!-- 阶段标题 -->
            <h4 class="text-lg font-semibold text-gray-800 mb-3">
              {{ item.title }}
            </h4>
            <!-- 发展描述 -->
            <p class="text-gray-600 leading-relaxed max-w-3xl">
              {{ item.description }}
            </p>
          </div>

          <!-- 右侧图片占位元素 -->
          <div v-if="item.image" class="md:w-1/3 flex-shrink-0">
            <div
              class="w-full h-48 bg-gray-100 rounded-lg flex items-center justify-center overflow-hidden"
            >
              <img
                :src="item.image"
                :alt="item.title"
                class="w-full h-full object-cover"
              />
            </div>
          </div>
        </div>
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
import { onMounted, ref } from 'vue'

// 发展历程数据对象
const timelineData = ref([
  {
    id: 1,
    year: '2019—2022',
    title: '社群孕育 · 衡水中学',
    description:
      '以景晔、纾浚、张理琦为代表的衡中学生，在疫情、校园管理等艰难条件下，围绕计算机、游戏创作、数字媒体等领域开展丰富的创意实践，逐步凝聚成学生社群，和瑛社正是在这一社群的基础上孕育发展而成。',
    isLast: false,
    delay: 100,
    image: '',
  },
  {
    id: 2,
    year: '2022-1-13',
    title: '和瑛一大 · 中州纪元',
    description:
      '和瑛社第一次全体会在保定召开。景晔、纾浚、长赓等列席会议，社团完成建制，开创了社团的首个项目——“中州纪元”，并将其确立为开展的主要工作。',
    isLast: false,
    delay: 200,
    image: '/images/about/history/1.webp',
  },
  {
    id: 3,
    year: '2022—2023',
    title: '学术化 · 商业化',
    description:
      '随着项目实践不断深化，全社认知持续提升，校准发展方向；此间相继召开和瑛二大、和瑛三大，逐步总结出了社团建设的商业化、学术化的发展路径。',
    isLast: false,
    delay: 300,
    image: '',
  },
  {
    id: 4,
    year: '2023-5-1',
    title: '和瑛四大 · 上海',
    description:
      '和瑛许多新晋成员首次线下相聚；对于 “我们何以相聚”、“我们的目标是什么” 等根本性问题进行深刻的阐释，构建起了组织理念的思想基础。',
    isLast: false,
    delay: 400,
    image: '/images/about/history/4.webp',
  },

  {
    id: 5,
    year: '2023-5-26',
    title: '双创 · 方块元宇',
    description:
      '在”商业化、学术化“方针的指引下，社团陆续锤炼了一批双创项目，“方块元宇”是集大成者；其斩获了以大创，互联网+，挑战杯为代表的10多项省、市、校各级项目立项和竞赛奖项，取得斐然成果。',
    isLast: false,
    delay: 500,
    image: '',
  },
  {
    id: 6,
    year: '2024-1-25',
    title: '和瑛五大 · 天津',
    description:
      '重新构建了社团的组织定位；选举产生新一届执委会；通过了成立公司的提案；将“商业化”延展为“企业化”建设，从理念、核心、道路多方面筑牢社团发展根基。',
    isLast: false,
    delay: 600,
    image: '/images/about/history/6.webp',
  },

  {
    id: 7,
    year: '2024-10-24',
    title: '创办企业 · 入驻南开科技园',
    description:
      '在南开大学商学院、南开大学科技园领导、老师的亲切关怀下，和瑛元筑（天津）数字科技有限公司在南开大学科技园正式注册营业。',
    isLast: false,
    delay: 800,
    image: '',
  },
  {
    id: 8,
    year: '2025-1',
    title: '福鼎模式 · 学研实践',
    description:
      '五大以来，社团赓续学术化建设路线，将 “学术” 延展为 “学研”；1月，和瑛学研实践队赴福鼎开展文化遗产数字化的社会实践；获丰硕成果；此后形成了 ”学研实践—成果转化—人的发展“ 的 ”福鼎模式“。',
    isLast: false,
    delay: 900,
    image: '',
  },
  {
    id: 999,
    year: '至今',
    title: '和瑛社 · 继往开来',
    description: '',
    isLast: false,
    delay: 900,
    image: '',
  },
])

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
