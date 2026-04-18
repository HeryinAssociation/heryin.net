<template>
  <section class="relative">
    <div class="max-w-6xl mx-auto px-4 sm:px-6">
      <!-- Hero content -->
      <div class="pt-32 pb-12 md:pt-40 md:pb-20">
        <!-- Section header -->
        <div class="text-center pb-12 md:pb-16">
          <div class="flex flex-col justify-center pb-6 md:pb-8">
            <img class="mx-auto max-h-44 md:max-h-64" src="/images/public/heryin-illu.svg" alt="Hero" />
          </div>
          <h1
            class="hidden md:flex md:justify-center text-7xl font-extrabold leading-tighter tracking-tighter mb-4"
          >
            <span
              style="font-family: 'Heryin'"
              class="bg-clip-text text-transparent bg-gradient-to-r from-red-500 to-orange-400"
            >
              终日乾乾，与时偕行
            </span>
          </h1>
          <h1
            class="md:hidden text-5xl leading-normal font-extrabold leading-tighter tracking-tighter mb-4"
          >
            <span
              style="font-family: 'Heryin'"
              class="bg-clip-text text-transparent bg-gradient-to-r from-red-500 to-orange-400"
            >
              终日乾乾<br />与时偕行
            </span>
          </h1>
          <div class="max-w-3xl mx-auto">
            <p class="text-xl text-gray-600 mb-8">
              和瑛社是一个致力于桥接理论与实践的差距，促进人的全面发展的学生社团。
            </p>
            <div
              class="max-w-xs mx-auto sm:max-w-none sm:flex sm:justify-center"
            >
              <div>
                <NuxtLink
                  class="btn text-white bg-red-600 hover:bg-red-700 w-full mb-4 sm:w-auto sm:mb-0"
                  to="/about"
                >
                  关于我们
                </NuxtLink>
              </div>
              <div>
                <NuxtLink
                  class="btn text-red-900 bg-red-100 hover:bg-red-200 border-red-300 w-full sm:w-auto sm:ml-4"
                  to="/project"
                >
                  详细了解
                </NuxtLink>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

