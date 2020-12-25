
const String FLUTTERWIDGET = """
## 1.Widget与Element
### Widget不是最终绘制在设备屏幕上的显示元素(屏幕上显示元素的类是Element)，而是描述显示元素的一个配置数据。(描述一个UI元素的配置数据)
> Widget只是UI元素的一个配置数据，并且一个Widget可以对应多个Element
```
@immutable
abstract class Widget extends DiagnosticableTree {
  const Widget({ this.key });
  final Key key;
...
```
## 2.StatelessWidget
### StatelessWidget它继承自Widget类，重写了createElement()方法：
```
@override
StatelessElement createElement() => new StatelessElement(this);
```
StatelessElement 间接继承自Element类，与StatelessWidget相对应（作为其配置数据）。

## 3.StatefulWidget
### 它继承自Widget类，重写了createElement()方法， 添加了一个新的接口createState()。
```
abstract class StatefulWidget extends Widget {
  const StatefulWidget({ Key key }) : super(key: key);

  @override
  StatefulElement createElement() => new StatefulElement(this);

  @protected
  State createState();
}
```
   - StatefulElement 间接继承自Element类，与StatefulWidget相对应（作为其配置数据）。
   StatefulElement中可能会多次调用createState()来创建状态(State)对象。
   - createState() 用于创建和Stateful widget相关的状态，它在Stateful widget的生命周期中可能会被多次调用。例如，当一个Stateful widget同时插入到widget树的多个位置时，Flutter framework就会调用该方法为每一个位置生成一个独立的State实例，其实，本质上就是一个StatefulElement对应一个State实例。

## 4.Context
### context是BuildContext类的一个实例，表示当前widget在widget树中的上下文，
> context是当前widget在widget树中位置中执行”相关操作“的一个句柄，
它提供了从当前widget开始向上遍历widget树以及按照widget类型查找父级widget的方法。
```
child: Builder(builder: (context) {
          // 在Widget树中向上查找最近的父级`Scaffold` widget
          Scaffold scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
          // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
          return (scaffold.appBar as AppBar).title;
        }),
```
## 5. State
### 一个StatefulWidget类会对应一个State类，State表示与其对应的StatefulWidget要维护的状态，State中的保存的状态信息
   - widget 构建时可以被同步读取。
   - 当State被改变时，可以手动调用其setState()方法，会重新调用其build方法重新构建widget树，从而达到更新UI的目的。
### State中有两个常用属性：
   - widget State实例关联的widget实例,UI树上的某一个节点的widget实例在重新构建时可能会变化，
   但State实例只会在第一次插入到树中时被创建，当在重新构建时，
   如果widget被修改了，会动态设置State.widget为新的widget实例。
   - context。StatefulWidget对应的BuildContext，作用同StatelessWidget的BuildContext,

## 6.State生命周期
   __理解State的生命周期对flutter开发非常重要__
![avatar](https://pcdn.flutterchina.club/imgs/3-2.jpg)
   * __initState__：当Widget第一次插入到Widget树时会被调用，只会调用一次该回调
   Widget树中的InheritFromWidget也可能会发生变化，所以正确的做法应该在在build（）方法或didChangeDependencies()中调用它。
   * __didChangeDependencies()__：当State对象的依赖发生变化时会被调用；例如：在之前build() 中包含了一个InheritedWidget，
   然后在之后的build() 中InheritedWidget发生了变化，那么此时InheritedWidget的子widget的didChangeDependencies()回调都会被调用。
   典型的场景是当系统语言Locale或应用主题改变时，通知widget调用此回调。
   * __build()__：它主要是用于构建Widget子树的，会在如下场景被调用：
      1. 在调用initState()之后。
      2. 在调用didUpdateWidget()之后。
      3. 在调用setState()之后。
      4. 在调用didChangeDependencies()之后。
      5. 在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
   * __reassemble()__：此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
   * __didUpdateWidget()__：在widget重新构建时，会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，
   然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。正如之前所述，
   在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用(相等时会返回true)。
   * __deactivate()__：当State对象从树中被移除时，会调用此回调。在一些场景下，会将State对象重新插到树中，
   如包含此State对象的子树在树的一个位置移动到另一个位置时（可以通过GlobalKey来实现）。
   如果移除后没有重新插入到树中则紧接着会调用dispose()方法。
   * __dispose()__：当State对象从树中被永久移除时调用；通常在此回调中释放资源。
   ```
class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key key,
    this.initValue: 0
  });

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {  
  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态  
    _counter=widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('&_counter'),
          //点击后计数器自增
          onPressed:()=>setState(()=> ++_counter,
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

}
```
## 7 在Widget树中获取State对象
> 由于StatefulWidget的的具体逻辑都在其State中，所以很多时候，我们需要获取StatefulWidget对应的State对象来调用一些方法，比如Scaffold组件对应的状态类ScaffoldState中就定义了打开SnackBar(路由页底部提示条)的方法。我们有两种方法在子widget树中获取父级StatefulWidget的State对象。
#### __通过Context获取__
### context对象有一个findAncestorStateOfType()方法，该方法可以从当前节点沿着widget树向上查找指定类型的StatefulWidget对应的State对象。下面是实现打开SnackBar的示例：
```
Scaffold(
  appBar: AppBar(
    title: Text("子树中获取State对象"),
  ),
  body: Center(
    child: Builder(builder: (context) {
      return RaisedButton(
        onPressed: () {
          // 查找父级最近的Scaffold对应的ScaffoldState对象
          ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
          //调用ScaffoldState的showSnackBar来弹出SnackBar
          _state.showSnackBar(
            SnackBar(
              content: Text("我是SnackBar"),
            ),
          );
        },
        child: Text("显示SnackBar"),
      );
    }),
  ),
);
```
上面示例运行后，点击”显示SnackBar“，效果如图3-1-2所示：
![avatar](https://pcdn.flutterchina.club/imgs/3-1-2.png)
### 如果StatefulWidget的状态是私有的（不应该向外部暴露），不应该去直接获取其State对象；
暴露出的StatefulWidget中提供一个of静态方法来获取其State对象.
> 希望暴露出的，可以去直接获取其State对象。但是通过context.findAncestorStateOfType获取StatefulWidget的状态的方法是通用的，
```
...//省略无关代码
// 直接通过of静态方法来获取ScaffoldState 
ScaffoldState _state=Scaffold.of(context); 
_state.showSnackBar(
  SnackBar(
    content: Text("我是SnackBar"),
  ),
);
```
#### __通过GlobalKey__
### 通过GlobalKey来获取State对象的方法！
   1.给目标StatefulWidget添加GlobalKey。
```
//定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
static GlobalKey<ScaffoldState> _globalKey= GlobalKey();
...
Scaffold(
    key: _globalKey , //设置key
    ...  
)
```
   2.通过GlobalKey来获取State对象
```
_globalKey.currentState.openDrawer()
```
GlobalKey是Flutter提供的一种在整个APP中引用element的机制。
如果一个widget设置了GlobalKey，那么我们便可以通过globalKey.currentWidget获得该widget对象、
globalKey.currentElement来获得widget对应的element对象，
如果当前widget是StatefulWidget，则可以通过globalKey.currentState来获得该widget对应的state对象。
> 注意：使用GlobalKey开销较大，如果有其他可选方案，应尽量避免使用它。另外同一个GlobalKey在整个widget树中必须是唯一的，不能重复。
   """;
