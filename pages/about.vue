<template>
  <div>
    <AboutHero class="pt-16 md:pt-20" />
    <AboutTabbar @on-change-tab="onChangeTab" />
    <component :is="selectedTabComponent" class="py-8 md:py-16" />
  </div>
</template>

<script setup lang="ts">
import { AboutHistory, AboutMember, AboutPartner } from '#components'

// 动态组件
const selectedTab = ref('AboutHistory')
const selectedTabComponent = computed(() => {
  return {
    AboutHistory,
    AboutMember,
    AboutPartner,
  }[selectedTab.value]
})

// 接收子组件传值
function onChangeTab(tabName: string) {
  selectedTab.value = tabName
}
</script>
