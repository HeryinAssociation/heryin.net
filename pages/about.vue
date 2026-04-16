<template>
  <div
    class="min-h-screen bg-gray-100 animate-in fade-in slide-up duration-700 mt-16 md:mt-20"
  >
    <MemoryMemories />
    <section
      class="max-w-6xl h-12 md:h-16 mx-auto border-b border-gray-200 flex opacity-0 translate-y-4 transition-all duration-300 ease-out"
      data-aos="fade-up"
    >
      <ul class="flex flex-wrap grow justify-around items-center">
        <li v-for="i in pageList" :key="i.name">
          <div
            class="text-sm md:text-xl transition duration-300 ease-in-out cursor-pointer"
            :class="{
              'text-red-500': i.selected,
              'hover:text-red-700': !i.selected,
            }"
            @click="onChangeTab(i)"
          >
            {{ i.name }}
          </div>
        </li>
      </ul>
    </section>
    <NuxtPage class="py-4 md:py-8" />
  </div>
</template>

<script setup lang="ts">
onMounted(() => {
  navigateTo('/about/history')

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

  document.querySelectorAll('[data-aos="fade-up"]').forEach((item) => {
    observer.observe(item)
  })
})

type tabItem = {
  name: string
  path: string
  selected: boolean
}

const pageList = reactive<tabItem[]>([
  {
    name: '和瑛系年',
    path: '/about/history',
    selected: false,
  },
  {
    name: '和瑛应用',
    path: '/about/member',
    selected: false,
  },
  {
    name: '和瑛文献',
    path: '/about/partner',
    selected: false,
  },
])
const lastSelectedTab = ref(pageList[0])
lastSelectedTab.value.selected = true
const onChangeTab = async (item: tabItem) => {
  item.selected = true
  lastSelectedTab.value.selected = false
  lastSelectedTab.value = item

  // 导航到目标路径
  await navigateTo(item.path)

  // 平滑滚动到导航栏位置，确保用户能看到导航栏和下方内容
  setTimeout(() => {
    // 尝试获取导航栏元素并滚动到其位置
    const navSection = document.querySelector('section[data-aos="fade-up"]')
    if (navSection) {
      // 滚动到导航栏上方一点的位置
      const navTop =
        navSection.getBoundingClientRect().top + window.pageYOffset - 20
      window.scrollTo({
        top: navTop,
        behavior: 'smooth',
      })
    } else {
      // 如果找不到导航栏元素，滚动到Memories组件下方
      const memoriesHeight = window.innerHeight * 0.8
      window.scrollTo({
        top: memoriesHeight,
        behavior: 'smooth',
      })
    }
  }, 100)
}
</script>
<style scoped>
.animate-in {
  animation-fill-mode: both;
}

.fade-in {
  animation-name: fadeIn;
}

.slide-up {
  animation-name: slideUp, fadeIn;
  animation-duration: 0.7s, 0.7s;
  animation-timing-function: ease-out, ease-out;
  animation-delay: 0s, 0s;
  animation-iteration-count: 1, 1;
  animation-direction: normal, normal;
  animation-fill-mode: both, both;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes slideUp {
  from {
    transform: translateY(16px);
  }
  to {
    transform: translateY(0);
  }
}
</style>
