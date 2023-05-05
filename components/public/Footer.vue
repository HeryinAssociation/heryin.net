<template>
  <footer>
    <div class="max-w-6xl mx-auto px-4 sm:px-6">
      <!-- Top area: Blocks -->
      <div
        class="grid sm:grid-cols-12 gap-8 py-8 md:py-12 border-t border-gray-200"
      >
        <!-- First block -->
        <div class="sm:col-span-12 lg:col-span-3">
          <div class="mb-2">
            <!-- Logo -->
            <NuxtLink to="/" class="inline-block" aria-label="GeekPara">
              <img :src="Logo" width="100" />
            </NuxtLink>
          </div>
          <div class="text-sm text-gray-600">
            <NuxtLink
              to="#"
              class="text-gray-600 hover:text-gray-900 hover:underline transition duration-150 ease-in-out"
            >
              条款
            </NuxtLink>
            ·
            <NuxtLink
              to="#"
              class="text-gray-600 hover:text-gray-900 hover:underline transition duration-150 ease-in-out"
            >
              隐私协议
            </NuxtLink>
          </div>
        </div>

        <!-- Center blocks -->
        <div
          class="sm:col-span-6 md:col-span-3 lg:col-span-2"
          v-for="i in content"
          :key="i.title"
        >
          <h6 class="text-gray-800 font-medium mb-2">{{ i.title }}</h6>
          <ul class="text-sm">
            <li class="mb-2" v-for="j in i.items" :key="j.name">
              <NuxtLink
                :to="j.link"
                :target="/http(.?):\/\/(.*)/.test(j.link) ? '_blank' : ''"
                class="text-gray-600 hover:text-gray-900 transition duration-150 ease-in-out"
              >
                {{ j.name }}
              </NuxtLink>
            </li>
          </ul>
        </div>

        <!-- Last block -->
        <div class="sm:col-span-6 md:col-span-3 lg:col-span-3">
          <h6 class="text-gray-800 font-medium mb-2">动态订阅</h6>
          <p class="text-sm text-gray-600 mb-4">
            定期将最新动态和文章发送到您的收件箱。
          </p>
          <form>
            <div class="flex flex-wrap mb-4">
              <div class="w-full">
                <label class="block text-sm sr-only" htmlFor="newsletter">
                  电子邮件地址
                </label>
                <div class="relative flex items-center max-w-xs">
                  <input
                    id="newsletter"
                    type="email"
                    class="form-input w-full text-gray-800 px-3 py-2 pr-12 text-sm"
                    placeholder="你的电子邮件地址......"
                    required
                  />
                  <button
                    type="submit"
                    class="absolute inset-0 left-auto"
                    aria-label="Subscribe"
                  >
                    <span
                      class="absolute inset-0 right-auto w-px -ml-px my-2 bg-gray-300"
                      aria-hidden="true"
                    ></span>
                    <svg
                      class="w-3 h-3 fill-current text-red-600 mx-3 shrink-0"
                      viewBox="0 0 12 12"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="M11.707 5.293L7 .586 5.586 2l3 3H0v2h8.586l-3 3L7 11.414l4.707-4.707a1 1 0 000-1.414z"
                        fillRule="nonzero"
                      />
                    </svg>
                  </button>
                </div>
                <!-- Success message -->
                <p class="mt-2 text-yellow-500 text-sm">订阅服务正在维护。</p>
              </div>
            </div>
          </form>
        </div>
      </div>

      <!-- Bottom area -->
      <div
        class="md:flex md:items-center md:justify-between py-4 md:py-8 border-t border-gray-200"
      >
        <div class="text-sm text-gray-600 mr-4 content-start">
          2018-{{ new Date().getFullYear() }}{{ ' ' }}
          <strong>和瑛社区 &copy; 版权所有</strong>
        </div>
        <div class="text-sm text-gray-600 mr-4 content-end">
          <NuxtLink to="https://beian.miit.gov.cn" target="_blank">
            琼ICP备2022009936号-1
          </NuxtLink>
        </div>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
import Logo from 'assets/images/public/heryin-logo.svg'

const content = [
  {
    title: '和瑛社区',
    items: [
      { name: '全部项目', link: '/project' },
      { name: '加入我们', link: '/join' },
      { name: '联系我们', link: 'mailto:contact@heryin.net' },
    ],
  },
  {
    title: '社交媒体',
    items: [
      { name: '哔哩哔哩', link: 'https://space.bilibili.com/359343298' },
      { name: '微博', link: 'https://weibo.com/u/7775335967' },
      // { name: 'YouTube', link: '' },
      // { name: 'Instagram', link: '' },
      // { name: 'Twitter', link: '' },
    ],
  },
  {
    title: '友情链接',
    items: [
      { name: '中州纪元', link: 'https://mc.heryin.net' },
      { name: '咔哩吧', link: 'https://mc.calibur.tv/' },
      { name: '极客学园', link: 'https://geekpara.com' },
    ],
  },
]
</script>
