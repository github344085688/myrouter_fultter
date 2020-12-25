
const String LAYOUTSCONTAINER = """
## Container(相当与div)
```
Container({
  this.alignment,
  this.padding, //容器内补白，属于decoration的装饰范围
  Color color, // 背景色
  Decoration decoration, // 背景装饰
  Decoration foregroundDecoration, //前景装饰
  double width,//容器的宽度
  double height, //容器的高度
  BoxConstraints constraints, //容器大小的限制条件
  this.margin,//容器外补白，不属于decoration的装饰范围
  this.transform, //变换
  this.child,
})
```
Container的大多数属性在介绍其它容器时都已经介绍过了，不再赘述，但有两点需要说明：
   - 容器的大小可以通过width、height属性来指定，也可以通过constraints来指定；如果它们同时存在时，width、height优先。实际上Container内部会根据width、height来生成一个constraints。
   - color和decoration是互斥的，如果同时设置它们则会报错！实际上，当指定color时，Container内会自动创建一个decoration。
   
 ![](https://pcdn.flutterchina.club/imgs/5-16.png)

实现代码如下：
```
Container(
  margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外填充
  constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
  decoration: BoxDecoration(//背景装饰
      gradient: RadialGradient( //背景径向渐变
          colors: [Colors.red, Colors.orange],
          center: Alignment.topLeft,
          radius: .98
      ),
      boxShadow: [ //卡片阴影
        BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0
        )
      ]
  ),
  transform: Matrix4.rotationZ(.2), //卡片倾斜变换
  alignment: Alignment.center, //卡片内文字居中
  child: Text( //卡片文字
    "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
  ),
);

```
可以看到Container具备多种组件的功能，通过查看Container源码，我们会很容易发现它正是前面我们介绍过的多种组件组合而成。在Flutter中，Container组件也正是组合优先于继承的实例。

### __Padding和Margin__
接下来我们来研究一下Container组件margin和padding属性的区别:
```
...
Container(
  margin: EdgeInsets.all(20.0), //容器外补白
  color: Colors.orange,
  child: Text("Hello world!"),
),
Container(
  padding: EdgeInsets.all(20.0), //容器内补白
  color: Colors.orange,
  child: Text("Hello world!"),
),
...
```
```
...
Padding(
  padding: EdgeInsets.all(20.0),
  child: DecoratedBox(
    decoration: BoxDecoration(color: Colors.orange),
    child: Text("Hello world!"),
  ),
),
DecoratedBox(
  decoration: BoxDecoration(color: Colors.orange),
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text("Hello world!"),
  ),
),
...
```


> Container在Flutter中太常见了。官方给出的简介，是一个结合了绘制（painting）、定位（positioning）以及尺寸（sizing）widget的widget。
### __1.1 组成__
### Container的组成如下：
   - 最里层的是child元素；
   - child元素首先会被padding包着；
   - 然后添加额外的constraints限制；
   - 最后添加margin。

### Container的绘制的过程如下：
  - 首先会绘制transform效果；
  - 接着绘制decoration；
  - 然后绘制child；
  - 最后绘制foregroundDecoration。
### Container自身尺寸的调节分两种情况：
  - Container在没有子节点（children）的时候，会试图去变得足够大。除非constraints是unbounded限制，在这种情况下，Container会试图去变得足够小。
  - 带子节点的Container，会根据子节点尺寸调节自身尺寸，但是Container构造器中如果包含了width、height以及constraints，则会按照构造器中的参数来进行尺寸的调节。
### __1.2 布局行为__
> 由于Container组合了一系列的widget，这些widget都有自己的布局行为，因此Container的布局行为有时候是比较复杂的。

一般情况下，Container会遵循如下顺序去尝试布局：
   - 对齐（alignment）；
   - 调节自身尺寸适合子节点；
   - 采用width、height以及constraints布局；
   - 扩展自身去适应父节点；
   - 调节自身到足够小。
进一步说：

   - 如果没有子节点、没有设置width、height以及constraints，并且父节点没有设置unbounded的限制，Container会将自身调整到足够小。
   - 如果没有子节点、对齐方式（alignment），但是提供了width、height或者constraints，那么Container会根据自身以及父节点的限制，将自身调节到足够小。
   - 如果没有子节点、width、height、constraints以及alignment，但是父节点提供了bounded限制，那么Container会按照父节点的限制，将自身调整到足够大。
   - 如果有alignment，父节点提供了unbounded限制，那么Container将会调节自身尺寸来包住child；
   - 如果有alignment，并且父节点提供了bounded限制，那么Container会将自身调整的足够大（在父节点的范围内），然后将child根据alignment调整位置；
   - 含有child，但是没有width、height、constraints以及alignment，Container会将父节点的constraints传递给child，并且根据child调整自身。
另外，margin以及padding属性也会影响到布局。

### __1.3 继承关系__
> Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > Container

从继承关系可以看出，Container是一个StatelessWidget。Container并不是一个最基础的widget，它是由一系列的基础widget组合而成。

2. 源码解析 构造函数如下：
```
Container({
    Key key,
    this.alignment,
    this.padding,
    Color color,
    Decoration decoration,
    this.foregroundDecoration,
    double width,
    double height,
    BoxConstraints constraints,
    this.margin,
    this.transform,
    this.child,
  })
```
> 平时使用最多的，也就是padding、color、width、height、margin属性。
### __2.1 属性解析__
__key__：Container唯一标识符，用于查找更新。

__alignment__：控制child的对齐方式，如果container或者container父节点尺寸大于child的尺寸，这个属性设置会起作用，有很多种对齐方式。

__padding__：decoration内部的空白区域，如果有child的话，child位于padding内部。padding与margin的不同之处在于，padding是包含在content内，而margin则是外部边界，设置点击事件的话，padding区域会响应，而margin区域不会响应。

__color__：用来设置container背景色，如果foregroundDecoration设置的话，可能会遮盖color效果。

__decoration__：绘制在child后面的装饰，设置了decoration的话，就不能设置color属性，否则会报错，此时应该在decoration中进行颜色的设置。

__foregroundDecoration__：绘制在child前面的装饰。

__width__：container的宽度，设置为double.infinity可以强制在宽度上撑满，不设置，则根据child和父节点两者一起布局。

__height__：container的高度，设置为double.infinity可以强制在高度上撑满。

__constraints__：添加到child上额外的约束条件。

__margin__：围绕在decoration和child之外的空白区域，不属于内容区域。

__transform__：设置container的变换矩阵，类型为Matrix4。

__child__：container中的内容widget。

```
new Container(
  constraints: new BoxConstraints.expand(
    height:Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
  ),
  decoration: new BoxDecoration(
    border: new Border.all(width: 2.0, color: Colors.red),
    color: Colors.grey,
    borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
    image: new DecorationImage(
      image: new NetworkImage('http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
      centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
    ),
  ),
  padding: const EdgeInsets.all(8.0),
  alignment: Alignment.center,
  child: new Text('Hello World',
    style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
  transform: new Matrix4.rotationZ(0.3),
)
```
> 最后都是转换为decoration来进行绘制的。如果同时包含decoration和color两种属性，则会报错。
### __2.4 使用场景__
Container算是目前项目中，最经常用到的一个widget。在实际使用过程中，笔者在以下情况会使用到Container，当然并不是绝对的，也可以通过其他widget来实现。

   - 需要设置间隔（这种情况下，如果只是单纯的间隔，也可以通过Padding来实现）；
   - 需要设置背景色；
   - 需要设置圆角或者边框的时候（ClipRRect也可以实现圆角效果）；
   - 需要对齐（Align也可以实现）；
   - 需要设置背景图片的时候（也可以使用Stack实现）。
### __3.1 注意事项__
有一个地方需要注意的。在控件的deactivate状态，我们需要将控件的属性初始到最开始的状态，例如在本例中，有如下代码：
``` 
 @override
  void deactivate() {
    super.deactivate();
    currentColor = widget.backgroundColor;
  }
  ```
这么做是为什么了？是因为在点击按钮进行页面跳转的时候，按钮处在点击态，当我们返回的时候，页面还是处在点击态，这显然就不正确了，因此需要我们手动的在deactivate状态下，将控件恢复到初始状态。但是呢，这个设置颜色，并不是说在deactivate的时候，就立马去刷新控件，而是在下次再进入这个页面的时候，再次运行build的时候，会按照这个初始值进行绘制，也就是恢复到了最开始的状态。

""";