<template>
  <div class="w-11/12 md:w-4/5 lg:w-3/4 2xl:w-2/3 m-auto">
    <div class="flex flex-col justify-center">
      <div
        id="proser"
        class="prose-headings:font-heryin prose-headings:text-center prose-headings:my-4 prose-h1:text-3xl prose-h1:md:text-4xl prose-h2:text-2xl prose-h2:md:text-3xl prose-p:my-4"
      >
        <h1>成员组成</h1>
        <p>和瑛由许多友爱的伙伴们组成。</p>
        <AboutMemberItem :member-field="coreMemberField">
          <template #title>核心成员</template>
          <template #description> 没有他们，就没有和瑛 </template>
        </AboutMemberItem>
        <AboutMemberItem :member-field="devMemberField">
          <template #title> {{ devMemberField.title }} </template>
          <template #description>
            {{ devMemberField.description }}
          </template>
        </AboutMemberItem>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import ImgZhao from '~/assets/images/about/member/Zhao.png'
type Member = {
  name: string
  info: string
  head: string
}
type MemberField = {
  title: string
  description: string
  memberList: Member[]
}

const coreConfig = await queryContent('about', 'member', 'core')
  .where({ _file: { $contains: 'json' } })
  .findOne()
const coreMemberList: Member[] = [
  {
    name: '景晔',
    info: '景晔，创始人，为了和瑛社而奋斗',
    head: ImgZhao,
  },
]

const coreMemberField = reactive<MemberField>({
  title: coreConfig.title!,
  description: coreConfig.description!,
  memberList: coreMemberList,
})

const devMemberField = reactive<MemberField>({
  title: '',
  description: '',
  memberList: [],
})

const devsConfig = await queryContent('about', 'member', 'devs')
  .where({ _file: { $contains: 'json' } })
  .findOne()
devMemberField.title = devsConfig.title!
devMemberField.description = devsConfig.description!
const devsQuery = await queryContent('about', 'member', 'devs')
  .where({ _file: { $contains: 'md' } })
  .find()
for (const devMember of devsQuery) {
  devMemberField.memberList.push({
    name: devMember.title || 'No name',
    info: devMember.info || 'No Info',
    head: devMember.headSrc || 'No Source',
  })
}
</script>
