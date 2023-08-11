<template>
  <section class="relative">
    <div class="max-w-6xl mx-auto px-4 sm:px-6">
      <!-- Hero content -->
      <div class="pt-32 pb-12 md:pt-40 md:pb-20">
        <!-- Section header -->
        <div class="text-center pb-12 md:pb-16">
          <div class="flex flex-col justify-center pb-6 md:pb-8">
            <img
              class="mx-auto max-h-44 md:max-h-64"
              :src="HeroImage"
              alt="Hero"
            />
          </div>
          <h1
            class="hidden md:flex md:justify-center text-7xl font-extrabold leading-tighter tracking-tighter mb-4"
            data-aos="zoom-y-out"
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
            data-aos="zoom-y-out"
          >
            <span
              style="font-family: 'Heryin'"
              class="bg-clip-text text-transparent bg-gradient-to-r from-red-500 to-orange-400"
            >
              终日乾乾<br />与时偕行
            </span>
          </h1>
          <div class="max-w-3xl mx-auto">
            <p
              class="text-xl text-gray-600 mb-8"
              data-aos="zoom-y-out"
              data-aos-delay="150"
            >
              和瑛社团是一个紧密团结的事业型同好社园，由一群怀瑞理想、志同道合的大学生组成。我们的业务主要涵盖游戏相关开发。
            </p>
            <div
              class="max-w-xs mx-auto sm:max-w-none sm:flex sm:justify-center"
              data-aos="zoom-y-out"
              data-aos-delay="300"
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
                  了解项目
                </NuxtLink>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import HeroImage from 'assets/images/public/heryin-illu.svg'
</script>
