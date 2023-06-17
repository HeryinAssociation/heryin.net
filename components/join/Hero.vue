<template>
  <section class="relative">
    <div class="max-w-6xl mx-auto px-4 sm:px-6">
      <!-- Hero content -->
      <div class="pt-28 pb-12 md:pt-35 md:pb-12">
        <!-- Section header -->
        <div class="text-center pb-12 md:pb-16">
          <div class="flex flex-col justify-center pb-6 md:pb-8">
            <img
              class="mx-auto max-h-full md:max-h-96"
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
              加入和瑛，展现自我
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
              加入和瑛<br />展现自我
            </span>
          </h1>
          <div class="max-w-3xl mx-auto">
            <p
              class="text-xl text-gray-600 mb-8"
              data-aos="zoom-y-out"
              data-aos-delay="150"
            >
              我们需要诸如三维动画建模、动画师、文案编纂等方面的人才。
            </p>
            <div
              class="max-w-xs mx-auto sm:max-w-none sm:flex sm:justify-center"
              data-aos="zoom-y-out"
              data-aos-delay="300"
            >
              <div>
                <NuxtLink
                  class="btn text-white bg-red-600 hover:bg-red-700 w-full mb-4 sm:w-auto sm:mb-0"
                  to="#position"
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

<script setup lang="ts">
import HeroImage from 'assets/images/join/Hero.webp'
</script>
