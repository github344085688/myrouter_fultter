import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:provider/provider.dart';
import 'package:my_router_flutter/flutter_pub/provider/counter.dart';
const String _MARKDOMDATE = """

## 1
# aaaaaaaaaaaaaaaaaaaaa
github-flavored-markdown#1
defunkt/github-flavored-markdown
#1
- [x] this is a complete item
- [ ] this is an incomplete item
- [x] @mentions, #refs, [links](),
**formatting**, and <del>tags</del>
supported
- [x] list syntax required (any
unordered or ordered list
supported)

First Header | Second Header
------------ | -------------
Content cell 1 | Content cell 2
Content column 1 | Content column 2


GitHub supports emoji!
:+1: :sparkles: :camel: :tada:
:rocket: :metal: :octocat: 


As Grace Hopper said:
> I’ve always been more interested
> in the future than in the past.




1. Item 1
2. Item 2
3. Item 3
 * Item 3a
 * Item 3b
 
img: assets/images/material_design_4.jpg
http://github.com - automatic!
[GitHub](http://github.com)


*This text will be italic*
_This will also be italic_
**This text will be bold**
__This will also be bold__
*You **can** combine them*


# This is an <h1> tag
## This is an <h2> tag
###### This is an <h6> tag




* Item 1
* Item 2
 * Item 2a
 * Item 2b
 
 
 ```
 ![](./assets/images/material_design_4.jpg)
// Format: ![Alt Text](url)

```
```
![Flutter logo](/assets/images/material_design_4.jpg)
![Flutter logo](assets/images/material_design_4.jpg)
resource:assets/images/material_design_4.jpg
resource:/images/material_design_4.jpg
![alt text](./assets/images/material_design_4.jpg)
![](./images/material_design_4.jpg)
![](assets/images/material_design_4.jpg)
![](/assets/images/material_design_4.jpg)
![](/images/material_design_4.jpg)
![alt text](images/material_design_4.jpg)
![](images/material_design_4.jpg)
resource:assets/images/material_design_4.jpg。
resource:./assets/images/material_design_4.jpg。
resource:/assets/images/material_design_4.jpg。
resource:/images/material_design_4.jpg。
resource:images/material_design_4.jpg。
```
\*literal asterisks\*


\ backslash

` backtick

* asterisk

_ underscore

{} curly braces

[] square brackets

() parentheses

# hash mark

+ plus sign

- minus sign (hyphen)

. dot

! exclamation mark


A First Level Header
====================

A Second Level Header
---------------------

Now is the time for all good men to come to
the aid of their country. This is just a
regular paragraph.

The quick brown fox jumped over the lazy
dog's back.

### Header 3

> This is a blockquote.
> 
> This is the second paragraph in the blockquote.
>
> ## This is an H2 in a blockquote
Output:

<h1>A First Level Header</h1>

<h2>A Second Level Header</h2>

<p>Now is the time for all good men to come to
the aid of their country. This is just a
regular paragraph.</p>

<p>The quick brown fox jumped over the lazy
dog's back.</p>

<h3>Header 3</h3>

<blockquote>
    <p>This is a blockquote.</p>

    <p>This is the second paragraph in the blockquote.</p>

    <h2>This is an H2 in a blockquote</h2>
</blockquote>
PHRASE EMPHASIS
Markdown uses asterisks and underscores to indicate spans of emphasis.

Markdown:

Some of these words *are emphasized*.
Some of these words _are emphasized also_.

Use two asterisks for **strong emphasis**.
Or, if you prefer, __use two underscores instead__.
Output:

<p>Some of these words <em>are emphasized</em>.
Some of these words <em>are emphasized also</em>.</p>

<p>Use two asterisks for <strong>strong emphasis</strong>.
Or, if you prefer, <strong>use two underscores instead</strong>.</p>
LISTS
Unordered (bulleted) lists use asterisks, pluses, and hyphens (*, +, and -) as list markers. These three markers are interchangable; this:

*   Candy.
*   Gum.
*   Booze.
this:

+   Candy.
+   Gum.
+   Booze.
and this:

-   Candy.
-   Gum.
-   Booze.
all produce the same output:

<ul>
<li>Candy.</li>
<li>Gum.</li>
<li>Booze.</li>
</ul>
Ordered (numbered) lists use regular numbers, followed by periods, as list markers:

1.  Red
2.  Green
3.  Blue
Output:

<ol>
<li>Red</li>
<li>Green</li>
<li>Blue</li>
</ol>
If you put blank lines between items, you’ll get <p> tags for the list item text. You can create multi-paragraph list items by indenting the paragraphs by 4 spaces or 1 tab:

*   A list item.

    With multiple paragraphs.

*   Another item in the list.
Output:

<ul>
<li><p>A list item.</p>
<p>With multiple paragraphs.</p></li>
<li><p>Another item in the list.</p></li>
</ul>
LINKS
Markdown supports two styles for creating links: inline and reference. With both styles, you use square brackets to delimit the text you want to turn into a link.

Inline-style links use parentheses immediately after the link text. For example:

This is an [example link](http://example.com/).
Output:

<p>This is an <a href="http://example.com/">
example link</a>.</p>
Optionally, you may include a title attribute in the parentheses:

This is an [example link](http://example.com/ "With a Title").
Output:

<p>This is an <a href="http://example.com/" title="With a Title">
example link</a>.</p>
Reference-style links allow you to refer to your links by names, which you define elsewhere in your document:

I get 10 times more traffic from [Google][1] than from
[Yahoo][2] or [MSN][3].

[1]: http://google.com/        "Google"
[2]: http://search.yahoo.com/  "Yahoo Search"
[3]: http://search.msn.com/    "MSN Search"
Output:

<p>I get 10 times more traffic from <a href="http://google.com/"
title="Google">Google</a> than from <a href="http://search.yahoo.com/"
title="Yahoo Search">Yahoo</a> or <a href="http://search.msn.com/"
title="MSN Search">MSN</a>.</p>
The title attribute is optional. Link names may contain letters, numbers and spaces, but are not case sensitive:

I start my morning with a cup of coffee and
[The New York Times][NY Times].

[ny times]: http://www.nytimes.com/
Output:

<p>I start my morning with a cup of coffee and
<a href="http://www.nytimes.com/">The New York Times</a>.</p>
IMAGES
Image syntax is very much like link syntax.

Inline (titles are optional):

![alt text](/path/to/img.jpg "Title")
Reference-style:

![alt text][id]

[id]: /path/to/img.jpg "Title"
Both of the above examples produce the same output:

<img src="/path/to/img.jpg" alt="alt text" title="Title" />
CODE
In a regular paragraph, you can create code span by wrapping text in backtick quotes. Any ampersands (&) and angle brackets (< or >) will automatically be translated into HTML entities. This makes it easy to use Markdown to write about HTML example code:

I strongly recommend against using any `<blink>` tags.

I wish SmartyPants used named entities like `&mdash;`
instead of decimal-encoded entites like `&#8212;`.
Output:

<p>I strongly recommend against using any
<code>&lt;blink&gt;</code> tags.</p>

<p>I wish SmartyPants used named entities like
<code>&amp;mdash;</code> instead of decimal-encoded
entites like <code>&amp;#8212;</code>.</p>
To specify an entire block of pre-formatted code, indent every line of the block by 4 spaces or 1 tab. Just like with code spans, &, <, and > characters will be escaped automatically.

Markdown:

If you want your page to validate under XHTML 1.0 Strict,
you've got to put paragraph tags in your blockquotes:

    <blockquote>
        <p>For example.</p>
    </blockquote>
Output:

<p>If you want your page to validate under XHTML 1.0 Strict,
you've got to put paragraph tags in your blockquotes:</p>

<pre><code>&lt;blockquote&gt;
    &lt;p&gt;For example.&lt;/p&gt;
&lt;/blockquote&gt;
</code></pre>





# Markdown Example
Markdown allows you to easily include formatted text, images, and even formatted
Dart code in your app.
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
[inline-style](https://www.google.com)
[reference-style][Google]
```
## Images
// ![Flutter logo](/dart-lang/site-shared/master/src/_assets/image/flutter/icon/64.png)
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
[Google]: https://www.google.com/
## Line Breaks
This is an example of how to create line breaks (tab or two whitespaces):
line 1
  
   
line 2
  
  
  
line 3
# Markdown Example
# Markdown Example
Markdown allows you to easily include formatted text, images, and even formatted
Dart code in your app.
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
[inline-style](https://www.google.com)
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
[Google]: https://www.google.com/
## Line Breaks
This is an example of how to create line breaks (tab or two whitespaces):
line 1
  
   
line 2
 
  
line 3

   """;
class MarkdownExample extends StatefulWidget {
  const MarkdownExample({Key key}) :super(key: key);

  @override
  _MarkdownExample createState() => _MarkdownExample();
}

class _MarkdownExample extends State<MarkdownExample> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(//使用SafeArea能很好的解决刘海，不规则屏幕的显示问题。
        child: Markdown(
          controller: controller,
          selectable: true,
          data: _MARKDOMDATE,
          // imageDirectory: 'https://raw.githubusercontent.com',
          builders: {
            'h6': CenteredHeaderBuilder(),
            'sub': SubscriptBuilder(),
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            Provider.of<Counter>(context, listen: false).add();
            controller.animateTo(0,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
          }

      ),
    );
  }
}

class CenteredHeaderBuilder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle preferredStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(text.text, style: preferredStyle),
      ],
    );
  }
}

class SubscriptBuilder extends MarkdownElementBuilder {
  static const List<String> _subscripts = [
    '₀',
    '₁',
    '₂',
    '₃',
    '₄',
    '₅',
    '₆',
    '₇',
    '₈',
    '₉'
  ];

  @override
  Widget visitElementAfter(md.Element element, TextStyle preferredStyle) {
    // We don't currently have a way to control the vertical alignment of text spans.
    // See https://github.com/flutter/flutter/issues/10906#issuecomment-385723664
    String textContent = element.textContent;
    String text = '';
    for (int i = 0; i < textContent.length; i++) {
      text += _subscripts[int.parse(textContent[i])];
    }
    return SelectableText.rich(TextSpan(text: text));
  }
}

class SubscriptSyntax extends md.InlineSyntax {
  static final _pattern = r'_([0-9]+)';

  SubscriptSyntax() : super(_pattern);

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    parser.addNode(md.Element.text('sub', match[1]));
    return true;
  }
}