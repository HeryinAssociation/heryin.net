<template>
  <section class="max-w-6xl h-12 md:h-16 mx-auto border-b border-gray-200 flex">
    <ul class="flex flex-wrap grow justify-around items-center">
      <li v-for="i in TabBarList" :key="i.name">
        <div
          class="text-sm md:text-xl transition duration-300 ease-in-out hover:text-red-700 cursor-pointer"
          @click="onChangeTab(i)"
        >
          <span v-if="i.selected" class="text-red-500">
            {{ i.name }}
          </span>
          <span v-else>
            {{ i.name }}
          </span>
        </div>
      </li>
    </ul>
    <div class=""></div>
  </section>
</template>

<script setup lang="ts">
// name 显示在 Tabbar 上
// componentName 传值到父组件，用于动态组件解析
// selected 用于决定选中的效果
type tabItem = {
  name: string
  componentName: string
  selected: boolean
}

const TabBarList = reactive<tabItem[]>([
  {
    name: '发展历程',
    componentName: 'AboutHistory',
    selected: false,
  },
  {
    name: '成员组成',
    componentName: 'AboutMember',
    selected: false,
  },
  {
    name: '合作伙伴',
    componentName: 'AboutPartner',
    selected: false,
  },
])
const emits = defineEmits(['onChangeTab'])
const lastSelectedTab = ref(TabBarList[0])
lastSelectedTab.value.selected = true
const onChangeTab = (item: tabItem) => {
  emits('onChangeTab', item.componentName)
  item.selected = true
  lastSelectedTab.value.selected = false
  lastSelectedTab.value = item
}
</script>

<style scoped>
/* .router-link-active {
  @apply text-red-600;
} */
</style>
