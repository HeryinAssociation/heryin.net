<template>
  <header
    :class="`fixed w-full z-30 transition duration-300 ease-in-out ${
      top ? 'bg-white backdrop-blur-sm md:bg-opacity-90' : 'bg-white backdrop-blur-sm shadow-lg md:bg-opacity-90'
    }`"
  >
    <div class="max-w-6xl mx-auto px-5 sm:px-6">
      <div class="flex items-center justify-between h-16 md:h-20">
        <!-- Site branding -->
        <div class="shrink-0 mr-4">
          <!-- Logo -->
          <NuxtLink to="/" class="block" aria-label="GeekPara">
            <img :src="Logo" width="100" />
          </NuxtLink>
        </div>

        <!-- Desktop navigation -->
        <nav class="hidden md:flex md:grow">
          <!-- Desktop menu links -->
          <ul class="flex grow justify-end flex-wrap items-center">
            <li v-for="i in NavBarList" :key="i.name">
              <NuxtLink
                :to="i.path"
                class="text-gray-600 hover:text-red-600 px-3 lg:px-5 py-2 flex items-center transition duration-150 ease-in-out"
                active-class="text-red-600 font-bold"
              >
                {{ i.name }}
              </NuxtLink>
            </li>
          </ul>

          <!-- Desktop sign in links -->
          <ul class="flex grow justify-end flex-wrap items-center">
            <li>
              <NuxtLink
                :to="NavBarButton.path"
                class="btn-sm text-white bg-red-600 hover:bg-red-700 ml-3"
              >
                <span>{{ NavBarButton.name }}</span>
                <svg
                  class="w-3 h-3 fill-current shrink-0 ml-2 -mr-1"
                  viewBox="0 0 12 12"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M11.707 5.293L7 .586 5.586 2l3 3H0v2h8.586l-3 3L7 11.414l4.707-4.707a1 1 0 000-1.414z"
                    fillRule="nonzero"
                  />
                </svg>
              </NuxtLink>
            </li>
          </ul>
        </nav>

        <!-- Mobile menu -->
        <div class="flex md:hidden">
          <!-- Hamburger button -->
          <button
            ref="{trigger}"
            :class="`hamburger ${mobileNavOpen ? 'active' : ''}`"
            aria-controls="mobile-nav"
            :aria-expanded="mobileNavOpen"
            @click="mobileNavOpen = !mobileNavOpen"
          >
            <span class="sr-only">Menu</span>
            <svg
              class="w-6 h-6 fill-current text-gray-900"
              viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <rect y="4" width="24" height="2" />
              <rect y="11" width="24" height="2" />
              <rect y="18" width="24" height="2" />
            </svg>
          </button>

          <!-- Mobile navigation -->

          <Transition
            tag="nav"
            id="mobile-nav"
            enter-active-class="transition ease-out duration-200 transform"
            enter-from-class="opacity-0 -translate-y-2"
            enter-to-class="opacity-100 translate-y-0"
            leave-active-class="transition ease-out duration-200"
            leave-from-class="opacity-100"
            leave-to-class="opacity-0"
          >
            <div
              v-show="mobileNavOpen"
              class="absolute top-full h-screen pb-16 z-20 left-0 w-full overflow-scroll bg-white"
            >
              <ul class="px-5 py-2">
                <!-- <li>
                  <h2 class="h2 flex text-gray-600 py-2">和瑛社</h2>
                </li> -->
                <li v-for="i in NavBarList" :key="i.name">
                  <NuxtLink
                    :to="i.path"
                    class="flex text-gray-600 hover:text-gray-900 py-2"
                  >
                    {{ i.name }}
                  </NuxtLink>
                </li>
                <li class="py-2">
                  <NuxtLink
                    :to="NavBarButton.path"
                    class="btn-sm text-white bg-red-600 hover:bg-red-700 ml-3"
                  >
                    <span>{{ NavBarButton.name }}</span>
                    <svg
                      class="w-3 h-3 fill-current shrink-0 ml-2 -mr-1"
                      viewBox="0 0 12 12"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="M11.707 5.293L7 .586 5.586 2l3 3H0v2h8.586l-3 3L7 11.414l4.707-4.707a1 1 0 000-1.414z"
                        fillRule="nonzero"
                      />
                    </svg>
                  </NuxtLink>
                </li>
              </ul>
            </div>
          </Transition>
        </div>
      </div>
    </div>
  </header>
</template>

<script setup lang="ts">
import Logo from '~/assets/images/public/heryin-logo.svg'

const top = ref(true)
const mobileNavOpen = ref(false)

const NavBarList = [
  {
    name: '首页',
    path: '/',
  },
  {
    name: '事业',
    path: '/project',
  },
  {
    name: '关于',
    path: '/about',
  },
]
const NavBarButton = {
  name: '加入我们',
  path: '/join',
}

onMounted(() => {
  window.addEventListener('scroll', scrollHandler)
  document.addEventListener('keydown', keyHandler)
})
onUnmounted(() => {
  window.removeEventListener('scroll', scrollHandler)
  document.removeEventListener('keydown', keyHandler)
})

function scrollHandler() {
  window.pageYOffset > 10 ? (top.value = false) : (top.value = true)
}

function keyHandler(e: any) {
  if (e.keyCode === 27) {
    mobileNavOpen.value = false
  }
}
</script>
