# Offical Site of Heryin

和瑛社官网。

用于构建(和瑛社官网)[https://heryin.net/]的源代码仓库。

通过 Vue3 + Nuxt3 + Vite 构建网页。

项目采用的包管理器为 pnpm，开发技术则选取了 TypeScript + SaSS + TailwindCSS + DaisyUI。

具体情况请参考 package.json 以及 \*.config.js、\*.config.ts 等配置文件

## 目录结构

**请参考 (Nuxt 目录结构的作用)[https://nuxt.com.cn/docs/guide/directory-structure/app]**

这里只给出 Nuxt 目录结构以外的部分，或者开发中需要解释的部分。

- .vscode # 使用 VSCode 开发时的插件建议
- app.vue # 入口
- assets/
- pages/
  - index
  - project
  - blog
  - about
  - join
- components/
  - public # 公用组件
  - index
  - project
  - blog
  - about
  - join
- doc/ # 开发文档
- content/ # 文字内容文件夹
- public/ # 公共资源文件夹

其中，涉及 `content/`、`public/` 的内容管理功能，都**将**会在 `doc/` 写明对应的功能如何使用。

待办列表在 `doc/TODO.md` 里。
