<template>
  <div>
    <AboutHero class="pt-16 md:pt-20" />
    <section
      class="max-w-6xl h-12 md:h-16 mx-auto border-b border-gray-200 flex"
    >
      <ul class="flex flex-wrap grow justify-around items-center">
        <li v-for="i in pageList" :key="i.name">
          <div class="text-sm md:text-xl" @click="onChangeTab(i)">
            <NuxtLink
              class="transition duration-300 ease-in-out cursor-pointer"
              :class="{
                'text-red-500': i.selected,
                'hover:text-red-700': !i.selected,
              }"
              :to="i.path"
            >
              {{ i.name }}
            </NuxtLink>
          </div>
        </li>
      </ul>
    </section>
    <NuxtPage class="py-8 md:py-16" />
  </div>
</template>

<script setup lang="ts">
// 动态组件
onMounted(() => {
  navigateTo('/about/history')
})

type tabItem = {
  name: string
  path: string
  selected: boolean
}

const pageList = reactive<tabItem[]>([
  {
    name: '组织沿革',
    path: '/about/history',
    selected: false,
  },
  {
    name: '成员组成',
    path: '/about/member',
    selected: false,
  },
  {
    name: '加入我们',
    path: '/join',
    selected: false,
  },
])
const emits = defineEmits(['onChangeTab'])
const lastSelectedTab = ref(pageList[0])
lastSelectedTab.value.selected = true
const onChangeTab = (item: tabItem) => {
  emits('onChangeTab', item.path)

  item.selected = true
  lastSelectedTab.value.selected = false
  lastSelectedTab.value = item
}
</script>
