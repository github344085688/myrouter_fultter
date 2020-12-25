const String SCROLLBARWIDGET = """
```
Scrollable({
    Key key,
    ///滚动方向
    this.axisDirection = AxisDirection.down,
    ///滚动控制器和事件监听
    ///在源码中是这样介绍的  ScrollController.initialScrollOffset  控制初始滚动的位置
    ///ScrollController.keepScrollOffset  控制是否应该自动在[PageStorage]中保存并恢复其滚动位      
    ///置
    ///ScrollController.offset 用来读取当前滚动位置
    this.controller,
    ///决定widget 在用户完成拖拽后的动画响应默认情况下会更护不同环境设置不同的变量
    ///ClampingScrollPhysics  android 使用的水波纹效果
    ///BouncingScrollPhysics：iOS下弹性效果  如果android 想要实现这个效果
    ///子布局高度的综合必须大于listview 的实际高度度即viewport
    this.physics,
    ///  用于生成子布局   类似android 中adapter 的getItem 方法
    @required this.viewportBuilder,
    ///
    this.incrementCalculator,
    /// 是否公开在语义数中,便于类似talkback的软件识别
    this.excludeFromSemantics = false,
    ///语义子集数
    this.semanticChildCount,
    ///处理拖动开始行为的方式与时机 
    ///有两个值 DragStartBehavior.start  DragStartBehavior.down 
    ///从字面理解就   start是从拖动开始,down是从触摸事件按下开始
    this.dragStartBehavior = DragStartBehavior.start,
  })
```
""";
