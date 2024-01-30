<template>
  <div class="w-11/12 md:w-4/5 lg:w-3/4 2xl:w-2/3 m-auto">
    <div class="flex flex-col justify-center">
      <div
        id="proser"
        class="prose-headings:font-heryin prose-headings:text-center prose-headings:my-4 prose-h1:text-3xl prose-h1:md:text-4xl prose-h2:text-2xl prose-h2:md:text-3xl prose-p:my-4"
      >
        <h1>成员组成</h1>
        <p>和瑛由许多友爱的伙伴们组成。</p>
        <template v-for="field of fieldList">
          <AboutMemberItem :member-field="field" />
        </template>
        <!-- <AboutMemberItem :member-head="coreMemberField" /> -->
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
type MemberHead = {
  title: string
  description: string
}
type MemberField = {
  head: MemberHead
  memberList: Member[]
}
type Paths = {
  path: string
}

// 对象数组中用于 sort 方法的排序函数
const sortBy = (attr: string, rev = 1) => {
  return (a: any, b: any) => rev * (a[attr] - b[attr])
}

// 获取 /content/about/member/config 的第一个 json 内容（也即 paths.json）
const { data: pathConfig } = await useAsyncData('path', () =>
  queryContent('about', 'member', 'config')
    .where({ _type: { $eq: 'json' } })
    .findOne()
)
// 用于渲染的列表
const fieldList = [] as MemberField[]

// 从获取的列表中循环获取 MemberHead 信息和 Member[] 信息
for (const pathItem of pathConfig.value?.paths as Paths[]) {
  // 从 JSON 文件获取 MemberHead
  const { data: config } = await useAsyncData('conf', () =>
    queryContent('about', 'member', pathItem.path)
      .where({ _type: { $eq: 'json' } })
      .findOne()
  )
  // 解析 JSON
  const head = {
    title: config.value!.title,
    description: config.value!.description,
  } as MemberHead

  // 最终被用于 push 入 fieldList 的 field
  const field = {
    head: head,
    memberList: [] as Member[],
  } as MemberField

  // 从 Markdown 文件中获取 Member[]
  const { data: memberList } = await useAsyncData('memberList', () =>
    queryContent('about', 'member', pathItem.path)
      .where({ _type: { $eq: 'markdown' } })
      .find()
  )
  // 解析 markdown 文件
  for (const memberRef of memberList.value!) {
    const member = {
      name: memberRef.name,
      info: memberRef.info,
      headSrc: memberRef.headSrc,
      index: memberRef.index,
    } as Member
    field.memberList.push(member)
  }
  // 排序函数
  field.memberList.sort(sortBy('index'))
  fieldList.push(field)
}
</script>
