<template>
  <section>
    <div class="pt-16 md:pt-20">
      <!-- Hero content -->
      <div class="text-center relative max-w-1080p mx-auto overflow-hidden">
        <!-- Section header -->
        <img
          class="z-0 w-full h-auto max-lg:hidden"
          :src="HeroImage"
          alt="Hero"
        />
        <img
          class="z-0 w-full h-auto lg:hidden"
          :src="HeroImageSm"
          alt="Hero"
        />
        <div class="absolute z-10 inset-0 w-full bg-gray-700 opacity-70"></div>
        <div
          class="absolute z-20 inset-0 justify-center items-center flex flex-col text-white"
        >
          <h1
            class="text-3xl md:text-5xl font-extrabold leading-tighter"
            style="font-family: 'Heryin'"
          >
            关于和瑛社
          </h1>
          <p>和瑛社是一个旨在……</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import HeroImage from 'assets/images/about/about-heryin-hero.png'
import HeroImageSm from 'assets/images/about/about-heryin-hero-sm.png'
</script>
