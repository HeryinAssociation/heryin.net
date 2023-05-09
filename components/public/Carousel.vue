<template>
  <div
    class="w-full relative overflow-hidden"
    :style="`height: ${props.height};`"
  >
    <TransitionGroup name="list">
      <div
        v-for="(i, index) in content"
        :key="typeof i === 'string' ? i : i.title"
      >
        <NuxtLink :to="typeof i === 'string' ? '' : i.link">
          <div
            class="relative w-full bg-cover bg-center flex-none"
            :style="`background-image: url(${
              typeof i === 'string' ? i : i.img
            }); height: ${props.height};`"
          >
            <div
              v-if="typeof i !== 'string'"
              class="absolute transform bottom-0 w-full py-20 px-6 md:px-20 bg-gradient-to-t from-red-900"
              data-aos="zoom-y-out"
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
      </div>
    </TransitionGroup>
    <div
      class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2"
    >
      <button class="btn btn-circle" @click="previouseTab">❮</button>
      <button class="btn btn-circle" @click="nextTab">❯</button>
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
const content = ref([props.contents[0]])

function nextTab() {
  currentTab.value = (currentTab.value + 1) % props.contents.length
  content.value = [props.contents[currentTab.value]]
}
function previouseTab() {
  currentTab.value =
    (currentTab.value - 1 + props.contents.length) % props.contents.length
  content.value = [props.contents[currentTab.value]]
}
</script>

<style scoped>
.list-enter-to {
  transition: all 1s ease;
  transform: translateX(0);
}

.list-leave-active {
  transition: all 1s ease;
  transform: translateX(-100%);
}

.list-enter {
  transform: translateX(100%);
}

.list-leave {
  transform: translateX(0);
}
</style>
