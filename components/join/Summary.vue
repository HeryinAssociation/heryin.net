<template>
  <section>
    <div id="contact" class="max-w-6xl mx-auto px-4 sm:px-6">
      <div class="pb-12 md:pb-20">
        <div class="bg-primary rounded py-10 px-8 md:py-12 md:px-12 shadow-2xl">
          <div class="flex flex-col justify-between items-center">
            <h3 class="hidden md:flex mb-6 h3 text-white text-center mb-2">
              熔铸兴趣与热爱，施展才华和本领。<br />
              认识自己、解放自己、发展自己<br />
              从必然王国走向自由王国！
            </h3>
            <NuxtLink
              class="btn btn-lg btn-wide text-primary bg-gradient-to-r from-red-100 to-white"
              to="https://heryinmc.feishu.cn/share/base/form/shrcnimDL1TpOgR4sjbzn0YENsb"
            >
              加入和瑛
            </NuxtLink>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
const showToast = inject<Function>('showToast', () => {})
</script>
