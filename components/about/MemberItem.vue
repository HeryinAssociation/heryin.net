<template>
  <div class="my-8" id="memberField">
    <div id="head">
      <h2>{{ memberField.head.title }}</h2>
      <p>{{ memberField.head.description }}</p>
    </div>
    <div
      id="cardContainer"
      class="mx-auto py-8 max-w-md sm:max-w-4xl xl:max-w-6xl 2xl:max-w-7xl grid gap-8 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 items-start"
    >
      <div
        v-for="i in memberField.memberList"
        id="card"
        class="relative bg-gray-100 flex gap-x-4 sm:flex-col items-center bg-base-white shadow-xl h-48 sm:h-96 xl:h-80 p-4 sm:p-6"
      >
        <img class="h-24 w-24 rounded-full" :src="i.headSrc" />
        <div class="flex flex-col">
          <p class="text-2xl font-bold leading-snug tracking-tight mt-4">
            {{ i.name }}
          </p>
          <p class="mt-4 text-gray-600">
            {{ i.info }}
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
type Member = {
  name: string
  info: string
  headSrc: string
  index: number
}
type MemberHead = {
  title: string
  description: string
}
type MemberField = {
  head: MemberHead
  memberList: Member[]
}
const prop = defineProps<{
  memberField: MemberField
}>()
</script>
