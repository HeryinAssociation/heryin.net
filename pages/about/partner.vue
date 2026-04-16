<template>
  <!-- 和瑛文献 书柜Section -->
  <section class="bookshelf max-w-6xl mx-auto px-5 sm:px-6">
    <!-- 标题 -->
    <div
      id="proser"
      class="prose-headings:font-heryin prose-headings:text-center prose-headings:my-4 prose-h1:text-3xl prose-h1:md:text-4xl prose-h2:text-2xl prose-h2:md:text-3xl prose-p:my-2 prose-a:text-red-800 mb-10"
    >
      <h1>和瑛文献</h1>
    </div>

    <!-- 书柜容器 -->
    <div class="bookshelf-container">
      <!-- 循环渲染书籍 -->
      <div
        v-for="(item, index) in timelineData"
        :key="item.id"
        class="book-item opacity-0 translate-y-4 transition-all duration-700 ease-out"
        data-aos="fade-up"
        :data-aos-delay="index * 100"
      >
        <!-- 书籍 -->
        <NuxtLink :to="item.link" class="book-link">
          <!-- 书脊 -->
          <div class="book-spine card">
            <!-- 年份 -->
            <div class="book-year">
              {{ item.year }}
            </div>
            <!-- 书名 -->
            <div class="book-title">
              {{ item.title }}
            </div>
          </div>
        </NuxtLink>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* 书柜容器 */
.bookshelf-container {
  display: flex;
  flex-wrap: wrap;
  gap: 1.5rem;
  padding: 2rem 0;
}

/* 书籍项 */
.book-item {
  flex: 0 0 calc(33.333% - 1rem);
  min-width: 200px;
}

/* 书籍链接 */
.book-link {
  display: block;
  text-decoration: none;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.book-link:hover {
  transform: translateY(-8px);
}

/* 书脊 */
.book-spine {
  background: linear-gradient(135deg, #8b4513 0%, #a0522d 100%);
  padding: 1.25rem 1.5rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 10px 20px rgba(0, 0, 0, 0.15);
  position: relative;
  overflow: hidden;
  min-height: 160px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
}

/* 书脊年份 */
.book-year {
  font-size: 0.75rem;
  color: rgba(255, 255, 255, 0.9);
  font-weight: 600;
  margin-bottom: 0.5rem;
  letter-spacing: 0.05em;
}

/* 书名 */
.book-title {
  font-size: 1.125rem;
  font-weight: 700;
  color: #ffffff;
  line-height: 1.4;
}

/* 响应式调整 */
@media (max-width: 768px) {
  .bookshelf-container {
    gap: 1rem;
  }

  .book-item {
    flex: 0 0 calc(50% - 0.5rem);
  }
}

@media (max-width: 480px) {
  .book-item {
    flex: 0 0 100%;
  }
}
</style>

<script setup lang="ts">
// 导入必要的模块
import { onMounted, ref } from 'vue'

// 和瑛文献数据对象
const timelineData = ref([
  {
    id: 1,
    year: '2024',
    title: '《和瑛社白皮书》',
    link: '#',
  },
  {
    id: 2,
    year: '2026',
    title: '《和瑛社团章程》',
    link: '#',
  },
  {
    id: 3,
    year: '2024',
    title: '《对和瑛自我定位的重新审视》',
    link: '#',
  },
  {
    id: 4,
    year: '2024',
    title: '《论初创阶段若干问题》',
    link: '#',
  },
  {
    id: 5,
    year: '2023',
    title: '《致新社员的一封信》',
    link: '#',
  },
  {
    id: 6,
    year: '2022',
    title: '《和瑛四大景晔致辞》',
    link: '#',
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

  // 观察所有书籍项
  document.querySelectorAll('.book-item').forEach((item) => {
    observer.observe(item)
  })
})
</script>
