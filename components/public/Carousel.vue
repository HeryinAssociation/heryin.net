<template>
  <div
    class="w-full relative overflow-hidden"
    :style="`height: ${props.height};`"
  >
    <template v-for="(i, index) in contents">
      <Transition :name="transitionName" mode="out-in">
        <NuxtLink
          v-if="currentTab === index"
          class="w-full"
          :to="typeof i === 'string' ? '' : i.link"
        >
          <div
            class="relative w-full bg-cover bg-center flex-none"
            :style="`background-image: url(${
              typeof i === 'string' ? i : i.img
            }); height: ${props.height};`"
          >
            <div
              v-if="typeof i !== 'string'"
              class="absolute transform bottom-0 w-full py-20 px-6 md:px-20 bg-gradient-to-t from-gray-950"
            >
              <h1
                :class="{
                  'text-4xl md:text-5xl lg:text-6xl': props.bigTitle,
                  'text-3xl md:text-4xl': !props.bigTitle,
                }"
                class="text-white"
                style="font-family: Heryin"
              >
                {{ i.title }}
              </h1>
              <p class="text-white text-md md:text-xl" v-html="i.text"></p>
            </div>
          </div>
        </NuxtLink>
      </Transition>
    </template>
    <div
      class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2"
    >
      <button type="button" class="btn btn-circle" @click="previousTab">
        ❮
      </button>
      <button type="button" class="btn btn-circle" @click="nextTab">❯</button>
    </div>
    <div class="absolute w-full text-center bottom-2">
      <span
        v-for="(i, index) in props.contents.length"
        :class="{
          'bg-primary': index === currentTab,
          'bg-gray-300': index !== currentTab,
        }"
        class="inline-block w-2 h-2 m-1"
      ></span>
    </div>
  </div>
</template>

<script setup lang="ts">
interface Props {
  contents:
    | {
        title: string
        text: string
        img: string
        link?: string
      }[]
    | string[]
  height?: string
  bigTitle?: boolean
}

const props = withDefaults(defineProps<Props>(), {
  height: '85vh',
  bigTitle: false,
})

const currentTab = ref(0)

function previousTab(event: MouseEvent): void {
  event.preventDefault()
  currentTab.value =
    (currentTab.value - 1 + props.contents.length) % props.contents.length
}

function nextTab(event: MouseEvent): void {
  event.preventDefault()
  currentTab.value = (currentTab.value + 1) % props.contents.length
}

const transitionName = ref('slide-right')

watch(currentTab, (val, old) => {
  transitionName.value = val > old ? 'slide-left' : 'slide-right'
})
</script>

<style scoped>
.slide-right-enter-from,
.slide-left-leave-to {
  transform: translateX(-100%);
}
.slide-left-enter-from,
.slide-right-leave-to {
  transform: translateX(100%);
}
.slide-right-leave-active,
.slide-right-enter-active,
.slide-left-leave-active,
.slide-left-enter-active {
  transition: transform 0.5s;
  position: absolute;
}
</style>
