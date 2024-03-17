<template>
  <div>
    <!-- 遍历部门 -->
    <div
      v-for="(department, index) in departments"
      :key="index"
      class="department-section my-8"
    >
      <div class="head">
        <h2>{{ department.title }}</h2>
        <p>{{ department.description }}</p>
      </div>
      <div
        class="cardContainer mx-auto py-8 max-w-md sm:max-w-4xl xl:max-w-6xl 2xl:max-w-7xl grid gap-8 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 items-start"
      >
        <!-- 遍历该部门的成员 -->
        <div
          v-for="member in department.members"
          :key="member.index"
          class="card relative bg-gray-100 flex gap-x-4 sm:flex-col items-center bg-base-white shadow-xl h-48 sm:h-96 xl:h-80 p-4 sm:p-6"
        >
          <img class="h-24 w-24 rounded-full" :src="member.headSrc" />
          <div class="flex flex-col">
            <p class="text-2xl font-bold tracking-tight mt-4">
              {{ member.name }}
            </p>
            <p>{{ member.info }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
type Member = {
  name: string
  info?: string
  headSrc: string
  index: number
}
type Department = {
  title: string
  description: string
  members: Member[]
}

const departments: Department[] = [
  {
    title: '部门一',
    description: '部门一的描述',
    members: [
      {
        name: '成员A',
        info: '成员A的信息',
        headSrc: '/path/to/imageA',
        index: 1,
      },
      // 部门一的其他成员
    ],
  },
  {
    title: '部门二',
    description: '部门二的描述',
    members: [
      {
        name: '成员B',
        info: '成员B的信息',
        headSrc: '/path/to/imageB',
        index: 2,
      },
      // 部门二的其他成员
    ],
  },
  {
    title: '部门三',
    description: '部门三的描述',
    members: [
      {
        name: '成员C',
        info: '成员C的信息',
        headSrc: '/path/to/imageC',
        index: 3,
      },
      // 部门三的其他成员
    ],
  },
  // 可以继续添加更多部门
]

onMounted(() => {
  useHead({ title: '和瑛社' })
})
</script>
