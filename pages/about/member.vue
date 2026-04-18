<template>
  <div class="w-11/12 md:w-4/5 lg:w-3/4 2xl:w-2/3 m-auto">
    <div class="flex flex-col justify-center">
      <div
        id="proser"
        class="prose-headings:font-heryin prose-headings:text-center prose-headings:my-4 prose-h1:text-3xl prose-h1:md:text-4xl prose-h2:text-2xl prose-h2:md:text-3xl prose-p:my-2 prose-a:text-red-800"
      >
        <h1>和瑛应用</h1>
        <div>
          <div>
            <!-- 遍历部门 -->
            <div
              v-for="(department, index) in departments"
              :key="index"
              class="department-section my-8"
            >
              <div class="head">
                <h2>{{ department.title }}</h2>
                <p>{{ department.description }}</p>
              </div>
              <div
                class="cardContainer mx-auto py-8 max-w-md sm:max-w-4xl xl:max-w-6xl 2xl:max-w-7xl grid gap-8 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 items-start"
              >
                <!-- 遍历该部门的成员 -->
                <NuxtLink
                  v-for="member in department.members"
                  :key="member.index"
                  class="card relative bg-gray-100 flex gap-x-4 sm:flex-col items-center bg-base-white shadow-sm hover:shadow-md transition duration-500 h-auto p-2 opacity-0 translate-y-4 transition-all duration-700 ease-out"
                  :to="member.lianjie"
                  data-aos="fade-up"
                >
                  <img
                    class="h-24 w-24 object-cover rounded-full"
                    :src="member.headSrc"
                  />
                  <div class="flex flex-col">
                    <a class="text-1xl font-bold tracking-tight mt-4">{{
                      member.name
                    }}</a>
                    <p>{{ member.info }}</p>
                  </div>
                </NuxtLink>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { onMounted } from 'vue'

type Member = {
  name: string
  info?: string
  headSrc: string
  index: number
  lianjie: string
}
type Department = {
  title: string
  description: string
  members: Member[]
}

const departments: Department[] = [
  {
    title: '',
    description: '',
    members: [
      {
        name: '元筑验证',
        info: '和瑛社社区共创在线验证系统',
        headSrc: '/images/about/app/3yuanzhu.webp',
        index: 1,
        lianjie: 'https://skin.metaconstr.net/ ',
      },
      {
        name: '飞书Lark',
        info: '和瑛社OA、内部办公协同系统',
        headSrc: '/images/about/app/1feishu.webp',
        index: 2,
        lianjie: 'https://heryin.feishu.cn/',
      },
      {
        name: '文件中心',
        info: '和瑛社文件中心、信息资源中心',
        headSrc: '/images/about/app/2fnos.webp',
        index: 3,
        lianjie: 'https://heryin.fnos.net/',
      },
      {
        name: 'Memo',
        info: '和瑛研发建筑遗产数字记忆平台',
        headSrc: '/images/about/app/4memo.webp',
        index: 4,
        lianjie: 'https://memo.heryin.net/',
      },
    ],
  },
]

onMounted(() => {
  useHead({ title: '和瑛社' })

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

  document.querySelectorAll('.card').forEach((item) => {
    observer.observe(item)
  })
})
</script>

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
  .cardContainer h2 {
    font-size: 1.75rem;
  }

  .card a {
    font-size: 1.25rem;
  }

  .card p {
    font-size: 0.875rem;
  }
}
</style>
