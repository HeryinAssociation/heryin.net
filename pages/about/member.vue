<template>
  <div class="w-11/12 md:w-4/5 lg:w-3/4 2xl:w-2/3 m-auto">
    <div class="flex flex-col justify-center">
      <div
        id="proser"
        class="prose-headings:font-heryin prose-headings:text-center prose-headings:my-4 prose-h1:text-3xl prose-h1:md:text-4xl prose-h2:text-2xl prose-h2:md:text-3xl prose-p:my-2 prose-a:text-red-800"
      >
        <h1>成员组成</h1>
        <p>和瑛由许多友爱的伙伴们组成。</p>
        <div>
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
                    <a
                      :href="member.lianjie"
                      class="text-2xl font-bold tracking-tight mt-4"
                      >{{ member.name }}</a
                    >
                    <p>{{ member.info }}</p>
                  </div>
                </div>
              </div>
            </div>
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
  lianjie: string
}
type Department = {
  title: string
  description: string
  members: Member[]
}

const departments: Department[] = [
  {
    title: '执行委员会',
    description: '社团发展的领航者；第二届执行委员会2024.1-2025.1',
    members: [
      {
        name: '景晔',
        info: '和瑛社创始人，执委主席，数字创意部部长；云大 MC 社区创始人，“像素云大”发起者，MC 高联常任理事，MC 建筑师，书法爱好者。',
        headSrc: '/images/about/member/core/Zhao.png',
        index: 1,
        lianjie: 'https://mualliance.ltd/ ',
      },
      {
        name: '张理琦',
        info: '执委常委，组织总监；南开 MC 社区创始人，原创词曲制作人',
        headSrc: '/images/about/member/core/zhang.png',
        index: 2,
        lianjie: 'https://blog.ricklos.top/',
      },
      {
        name: '纾浚',
        info: '联合创始人，执委常委，技术运维部部长；全栈开发者，燕大 MC 社运维部部长',
        headSrc: '/images/about/member/core/shujun.png',
        index: 3,
        lianjie: 'https://space.bilibili.com/155369896',
      },
      {
        name: '里鸿',
        info: '联合创始人，执委常委，企业化事业群主任，主管企业化建设工作；北科大文法学院辩论队队长',
        headSrc: '/images/about/member/core/lihong.png',
        index: 4,
        lianjie: '',
      },
    ],
  },
  {
    title: '企业化事业群',
    description: '服务于社团创新创业，面向现代市场经济的探索平台',
    members: [
      {
        name: '里鸿',
        info: '联合创始人，执委常委，企业化事业群主任，主管企业化建设工作；北科大文法学院辩论队队长',
        headSrc: '/images/about/member/core/lihong.png',
        index: 4,
        lianjie: '',
      },
      {
        name: '张理琦',
        info: '执委常委，组织总监；南开 MC 社区创始人，原创词曲制作人',
        headSrc: '/images/about/member/core/zhang.png',
        index: 2,
        lianjie: 'https://blog.ricklos.top/',
      },
      {
        name: '九方晓月',
        info: '法务专员，主管法务工作；西北政法大学法律系学生、古典诗词爱好者、民族乐器博主、西法大星火志愿者协会会长',
        headSrc: '/images/about/member/cdv/jiufangxiaoyue.jpeg',
        index: 2,
        lianjie:
          'https://www.xiaohongshu.com/user/profile/62b8fe4e000000001b024152',
      },
      {
        name: 'Gfone',
        info: '财务会计专员；暨南大学会计学专业、暨大创协策划部、南校乒协副会长、管院青协领队、探险爱好者',
        headSrc: '/images/about/member/cdv/swy.jpg',
        index: 2,
        lianjie: '',
      },

      // 部门二的其他成员
    ],
  },
  {
    title: '技术运维部',
    description: '面向社团建设和项目开发的需要，提供智力支持和技术服务。',
    members: [
      {
        name: '纾浚',
        info: '联合创始人，执委常委，技术运维部部长；全栈开发者，燕大 MC 社运维部部长',
        headSrc: '/images/about/member/core/shujun.png',
        index: 3,
        lianjie: 'https://space.bilibili.com/155369896',
      },
      {
        name: '抖飞',
        info: '技术运维部副部长，主管服务器硬件运维，分管航空建模与制图项目；电脑硬件、胶卷爱好者，航模飞手。',
        headSrc: '/images/about/member/devs/doufei.png',
        index: 3,
        lianjie: '',
      },
      {
        name: '米若',
        info: '社区运营部总理；Calibur Pixel 服主，Arcomua Team 领导者、服务器运维、蔚蓝档案玩家。',
        headSrc: '/images/about/member/devs/MetroCrt.png',
        index: 3,
        lianjie: '',
      },
      {
        name: '谷维素',
        info: '社区运营部副总理，主管工程建设国庆献礼项目；山东大学学生、Hypixel 简中翻译组成员、农场躲猫猫中国胜场第一，全球排名前二十。',
        headSrc: '/images/about/member/devs/Oryzanol.png',
        index: 3,
        lianjie: '',
      },
      {
        name: '艾拉',
        info: '音 MADer、设计师、独立开发者、技术爱好者、服务器运维、NOVA 音 MAD 社创始人、中文音 MAD 维基站长、Calibur 站长。',
        headSrc: '/images/about/member/devs/Avatar.png',
        index: 3,
        lianjie: 'https://space.bilibili.com/22807093',
      },
      {
        name: '小宇',
        info: '社区运营部副总理；前南林像素工坊负责人、南林复原工程、软件工程专业、前端开发者、服务器运维。',
        headSrc: '/images/about/member/devs/xiaoyu.png',
        index: 3,
        lianjie: '',
      },
      {
        name: 'Hissin',
        info: '主管和瑛联合验证运维工作；全栈开发者，高级系统架构师，UI 设计师。',
        headSrc: '/images/about/member/devs/hissin.png',
        index: 3,
        lianjie: 'https://hissin.cn/',
      },
    ],
  },
  {
    title: '数字创意部',
    description:
      '数字创意部以创意驱动为指导，以观众认可为核心目标，专注于内容创作，策展创意项目的业务部门。',
    members: [
      {
        name: '景晔',
        info: '和瑛社创始人，执委主席，数字创意部部长；云大 MC 社区创始人，“像素云大”发起者，MC 高联常任理事，MC 建筑师，书法爱好者。',
        headSrc: '/images/about/member/core/Zhao.png',
        index: 1,
        lianjie: 'https://mualliance.ltd/ ',
      },
      {
        name: '夏天芜',
        info: '数字创意部副部长，负责融媒体主持工作；配音爱好者，福瑞重度爱好者、四坑少女、南开大学商学院团委秘书中心拉磨的驴（）',
        headSrc: '/images/about/member/dec/xiatianwu.png',
        index: 2,
        lianjie: '',
      },
      {
        name: '星洲',
        info: '第一开发局主任；哈工威在校学生，后端开发者、算法工程师、独立开发者、技术爱好者、服务器运维、B 站主播',
        headSrc: '/images/about/member/dec/xingzhou.jpg',
        index: 3,
        lianjie: 'https://space.bilibili.com/354092880',
      },
      {
        name: 'Wonder Yours',
        info: '第一开发局副主任；MC 插件与模组开发者、前端开发者，掀垫子柯基大学在校学生（）',
        headSrc: '/images/about/member/dec/wdyz.jpg',
        index: 4,
        lianjie: '',
      },
      {
        name: '极光',
        info: '古典园林爱好者、古建筑爱好者、模型爱好者、MC 建筑师、英语四级困难户（）',
        headSrc: '/images/about/member/dec/jiguang.jpeg',
        index: 4,
        lianjie: 'https://space.bilibili.com/197431103',
      },
      {
        name: 'Dy镝',
        info: '前端开发、技术爱好者、MC 社区相关理论研究；目前负责和瑛前端的开发及维护。',
        headSrc: '/images/about/member/dec/Dy.png',
        index: 4,
        lianjie: 'https://www.zhihu.com/people/LdoDoeg222',
      },
    ],
  },
]

onMounted(() => {
  useHead({ title: '和瑛社' })
})
</script>
