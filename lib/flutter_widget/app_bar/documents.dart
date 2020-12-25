import 'package:flutter/material.dart';

const String APPBAR_DOC = '''
##  markdown语法 (_flutter_markdown_)
- __Example__
```
void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new Markdown(data: markdownData)
    )
  ));
}
```
 [hyperlinks](https://flutter.dev) 
 ![Flutter logo](https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png)
- __leading__ _左侧显示的图标 通常首页显
   示的为应用logo 在其他页面为返回按钮._

- __title__ _标题文本._
- __actions__ _右侧item._
- __flexibleSpace__ _显示在 AppBar 下方的控件，高度和 AppBar 高度一样，可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用._
- __bottom__ _一个 AppBarBottomWidget 对象，通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏._
- __elevation__ _控件的 z 坐标顺序，默认值 4，对于可滚动的._
- __SliverAppBar__ _，当 SliverAppBar 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值。._
- __shape__ 
- __backgroundColor__ _AppBar背景色._
- __brightness__ _AppBar亮度 有黑白两种主题._
- __iconTheme__ _AppBar上图标的样式._
- __actionsIconTheme__ _AppBar上actions图标的样式._
- __textTheme__ _AppBar上文本样式._
- __centerTitle__ _标题是否居中._
- __titleSpacing__ _标题与其他控件的空隙._
- __toolbarOpacity__ _AppBar tool区域透明度._
- __bottomOpacity__ _bottom区域透明度._
    ''';


const String APPBAR_DOCs = '''# Markdown Example
Markdown allows you to easily include formatted text, images, and even formatted Dart code in your app.

## Titles

Setext-style

```
This is an H1
=============

This is an H2
-------------
```

Atx-style

```
# This is an H1

## This is an H2

###### This is an H6
```

Select the valid headers:

- [x] `# hello`
- [ ] `#hello`

## Links

[Google's Homepage][Google]

```
[inline-style](https://www.google.cn)

[reference-style][Google]
```

## Images

![Flutter logo](/dart-lang/site-shared/master/src/_assets/image/flutter/icon/64.png)

## Tables

|Syntax                                 |Result                               |
|---------------------------------------|-------------------------------------|
|`*italic 1*`                           |*italic 1*                           |
|`_italic 2_`                           | _italic 2_                          |
|`**bold 1**`                           |**bold 1**                           |
|`__bold 2__`                           |__bold 2__                           |
|`This is a ~~strikethrough~~`          |This is a ~~strikethrough~~          |
|`***italic bold 1***`                  |***italic bold 1***                  |
|`___italic bold 2___`                  |___italic bold 2___                  |
|`***~~italic bold strikethrough 1~~***`|***~~italic bold strikethrough 1~~***|
|`~~***italic bold strikethrough 2***~~`|~~***italic bold strikethrough 2***~~|

## Styling
Style text as _italic_, __bold__, ~~strikethrough~~, or `inline code`.

- Use bulleted lists
- To better clarify
- Your points

## Code blocks
Formatted Dart code looks really pretty too:

```
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Markdown(data: markdownData),
    ),
  ));
}
```

## Center Title

###### ※ ※ ※

_* How to implement it see main.dart#L129 in example._

## Custom Syntax

NaOH + Al_2O_3 = NaAlO_2 + H_2O

C_4H_10 = C_2H_6 + C_2H_4

## Markdown widget

This is an example of how to create your own Markdown widget:

    Markdown(data: 'Hello _world_!');

Enjoy!

[Google]: https://www.google.cn/

## Line Breaks

This is an example of how to create line breaks (tab or two whitespaces):

line 1
  
   
line 2
  
  
  
line 3
''';
