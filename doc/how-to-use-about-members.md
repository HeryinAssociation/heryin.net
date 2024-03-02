# 如何使用“关于 - 成员”界面

首先，有两个大文件夹是可以被使用的，它们分别是：

- content/about/member/
- public/images/about/member/

## 结构一览

关于它们的结构，当然也需要解释一下：

```
- content/about/member/
  - config/paths.json
  - _directories-whom-you-named.../_
    - \*.json
    - _other-markdown-files.md..._
- public/images/about/member/
  - _directories-whom-you-named..._
    - _head-icon.any-ext..._
```

其中，paths.json 是用于存放**目录名列表**的，程序会识别其中的**目录名**。不过，paths.json 中并不会识别列表的 comment 字段，这是用于备注的，以防名字出错。

稍后，程序将在 `content/about/member/` 下自动寻找对应目录下的文件，并按照**目录名列表**的顺序来排序。
并且，程序将在 `public/images/about/member/`的对应目录下查找头像图片。（因为使用 Nuxt3 和 NuxtContent 管理内容时，只能通过 public 文件夹来导入静态图片。）

## 指定了目录并新建对应目录后……

而在 paths.json 指定了目录名，并且在 `content/about/member/` 下创建了对应目录后，程序将在这个目录下寻找两种文件：`*.json` 和 `*.md` 文件

程序将查找对应目录下**文件名首字母编码顺序第一**的 `.json` 文件，读取其中的 `title` 和 `description` 字段，用于指定成员域的标题、描述。

至于 `.md` 文件，则读取其中的 `name`、`headSrc`、`index` 以及文章内容，指定了成员名、成员头像路径（无须 `/public/` 前缀，Nuxt 3 直接以 `public/` 为静态资源根目录）、顺序（升序，从小到大）、成员信息。

## 最佳实践

因此，`content/about/member` 目录的最佳实践：

1. 在 `content/about/member/config/path.json` 指定目录名
2. 在 `content/about/member/` 和 `public/images/about/member/` 下创建对应名称的目录，
3. 在 content 新建的目录下新建一个 JSON 文件，指定 title 和 description。
4. 在 content 新建的目录下新建若干个 Markdown，指定其 name、headSrc、index，并且直接在文章内填写内容。
5. 在 public/images 新建的目录下放置指定清晰的头像图片文件（暂不支持 svg）。
