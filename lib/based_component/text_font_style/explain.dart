
const String TEXTFONTSTYLE = """
```
Text(
        style: TextStyle(            
            decoration: TextDecoration.none,  // none 不显示装饰线条，underline 字体下方，overline 字体上方，lineThrough穿过文字
            decorationStyle: TextDecorationStyle.solid,// solid 直线，double 双下划线，dotted 虚线，dashed 点下划线，wavy 波浪线
            decorationColor: Colors.red,// 装饰线的颜色
            fontStyle: FontStyle.normal,// normal 正常，italic 斜体 
            letterSpacing: 1.0,// 文字间的宽度           
            height: 1, // 文本行与行的高度，作为字体大小的倍数（取值1~2，如1.2）
            TextBaseline:TextBaseline.alphabetic/ideographic：文本基线是标准的字母基线/文字基线是表意字基线 //如果字符本身超出了alphabetic 基线，那么ideograhpic基线位置在字符本身的底部。
            ),       
        strutStyle: StrutStyle( ) ,   // 段落的间距样式          
        textAlign: TextAlign.center,  // 文字对齐方式        
        textDirection: TextDirection.ltr,// 文字排列方向 ltr 左到右，rtl右到左       
        locale: Locale('zh_CN'), // 用于选择区域特定字形的语言环境       
        softWrap: false, // 软包裹 ，文字是否应该在软断行出断行       
        overflow: TextOverflow.clip, // 如何处理视觉溢出:clip 剪切溢出的文本以修复其容器。ellipsis 使用省略号表示文本已溢出。fade 将溢出的文本淡化为透明
        textScaleFactor: 1.0,// 文字的缩放比例        
        maxLines: 2,// 文本要跨越的可选最大行数,        
        semanticsLabel: 'text demo',// 图像的语义描述，用于向Andoid上的TalkBack和iOS上的VoiceOver提供图像描述
        textWidthBasis: TextWidthBasis.longestLine,
      )
```
   """;
