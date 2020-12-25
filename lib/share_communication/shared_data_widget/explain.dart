
const String SHAREDDATAWIDGET =
'''
## 1. 关于Context（上下文）的理解
***
>> ### 所谓的上下文就是指语境，每一段程序都有很多的外部变量。只有想Add这种简单的函数才是没有外部变量的。一旦写的一段程序中有了外部变量，这段程序就是不完整的，不能独立运行，要想让他运行，就必须把所有的外部变量的值一个一个的全部传进去，这些值的集合就叫上下文。
说的通俗一点就是一段程序的执行需要依赖于外部的一些环境（外部变量等等），如果没有这些外部环境，这段程序是运行不起来的。
## 2. BuildContext与InheritedWidget
***
> ### 在Flutter中Widjet，State，BuildContext，InheritedWidget在整个小部件里都是非常重要的概念。如何自定义，如何使用都需要对这几个概念十分了解。
### BuildContext只不过是对构建的所有窗口小部件的树结构中的窗口小部件的位置的引用。简而言之，将BuildContext视为Widgets树的一部分，Widget将附加到此树。一个BuildContext只属于一个小部件。


### _如果窗口小部件“A”具有子窗口小部件，则窗口小部件“A”的BuildContext将成为直接子窗口BuildContexts的父BuildContext。很明显BuildContexts是链接的，并且正在组成BuildContexts树（父子关系）。_

__BuildContext可见性（简化语句）：
“ Something ”仅在其自己的BuildContext或其父BuildContext的BuildContext中可见。__

>比如一个例子是，考虑Scaffold> Center> Column> Text，我希望从最后面的Text找到最顶端的Widjet：
```
context.ancestorWidgetOfExactType（Scaffold）=>通过从Text上下文转到树结构来返回第一个Scaffold。
```
> ### 从父BuildContext，也可以找到一个后代（=子）Widget，但不建议这样做
在上文总结了State，那么State与BuildContext有啥关系呢？

## 2.1 无状态Widget: Stateless Widget
---
### 这些可视组件中的一些除了它们自己的配置信息之外不依赖于任何其他信息，该信息在其直接父级构建时提供。
>> ## 无状态窗口Widget只能在加载/构建窗口Widget时绘制一次，这意味着无法基于任何事件或用户操作重绘窗口Widget。

## 2.2 有状态的Widget:Stateful Widget
***
### 其他一些Widget将处理一些在Widget生命周期内会发生变化的内部数据。因此，该数据变得动态。此Widget保存的数据集可能会在此Widget的生命周期内发生变化，称为State。
<br>

## 2.3 State
***
### State定义StatefulWidget实例的“行为”部分。
### 它包含旨在与Widget交互/干扰的信息：

- ### 行为
- ### 布局
##### __应用于状态的任何更改都会强制Widget重建。__

## 2.4 State和BuildContext之间的关系
---
### 对于有状态窗口Widget，状态与BuildContext关联。此关联是永久性的 ，State对象永远不会更改其BuildContext。即使可以在树结构周围移动Widget BuildContext，State仍将与该BuildContext保持关联。
##### __当State与BuildContext关联时，State被视为已挂载。__
>  ### 重点：由于State对象与BuildContext相关联，这意味着State对象不能（直接）通过另一个BuildContext访问！（我们将在稍后讨论这个问题）。

## 2.5 有状态的Widget:Stateful Widget 的生命周期
***
### 由于本文的主要目的是用“变量”数据来解释State的概念，我将故意跳过与某些Stateful Widget overridable方法相关的任何解释，这些方法与此没有特别的关系。
```
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({
    Key key,
    this.parameter,
  }): super(key: key);

  final parameter;

  @override
  _MyStatefulWidgetState createState() => new _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  void initState(){
    super.initState();

    // Additional initialization of the State
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();

    // Additional code
  }

  @override
  void dispose(){
    // Additional disposal code

    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new ...
  }
}
```
-  ##  initState()
- ### initState（）方法是创建State对象后要调用的第一个方法（在构造函数之后）
+ ### 需要执行其他初始化时，将覆盖重写此方法。典型的初始化与动画，控制器有关
* ### 则需要在第一个位置调用super.initState（）方法
* ### 在这个方法中，上下文context可用，但你还不能真正使用它，因为框架还没有完全将状态与它相关联
* ### initState()方法完成后，State对象现在已初始化，上下文可用
>> ### 在此State对象的生命周期内不再调用此方法。


- ##  didChangeDependencies()
- ### didChangeDependencies()方法是要调用的第二个方法。
+ ### 在此阶段，由于上下文可用，您可以使用它。
* ### 如果您的Widget链接到InheritedWidget和/或您需要初始化一些侦听器（基于BuildContext），则通常会覆盖此方法。
> ### 请注意，如果您的窗口Widget链接到InheritedWidget，则每次重建此窗口Widget时都会调用此方法。。
> 如果重写此方法，则应首先调用super.didChangeDependencies()。


- ##  build()
- ### build(BuildContext context)方法在didChangeDependencies()（和didUpdateWidget）之后调用。
+ ### 这是您构建窗口Widget（可能还有任何子树）的位置。
* ### 每次State对象更改时（或者当InheritedWidget需要通知“已注册”的Widget时）都会调用此方法！
* ### 为了强制重建，您可以调用setState((){...})方法。


- ## dispose()
- ### 放弃窗口Widget时调用dispose（）方法。
+ 如果你需要执行一些清理（例如监听器，控制器…），然后立即调用super.dispose（），则覆盖此方法。


## 2.6 选择无状态还是有状态Widget？
---
> 在我的Widget的生命周期中，我是否需要考虑一个将要更改的变量，何时更改，将强制重建Widget,那么您需要一个有状态的Widget，否则，您需要一个无状态Widget。
### 带有表格的屏幕。该屏幕允许用户填写表单的窗口Widget并将表单发送到服务器。在这种情况下，在这种情况下，除非您在提交表单之前需要验证表单或执行任何其他操作，否则无状态窗口Widget可能就足够了。




## 2.7 Stateful Widget由2部分组成
---
### StatefulWidget有两个部分：

__(一) Widget的主要定义__
```
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({
    Key key,
    this.color,
  }): super(key: key);

  final Color color;

  @override
  _MyStatefulWidgetState createState() => new _MyStatefulWidgetState();
}
```
- ### 第一部分“MyStatefulWidget”通常是Widget的公共部分。当您要将其添加到窗口Widget树时，可以实例化此部件。此部分在Widget的生命周期内不会发生变化，但可能接受可由其相应的State实例使用的参数。
>请注意，在Widget的第一部分定义的任何变量通常在其生命周期内不会更改。

__(二)Widget State定义__
```
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  ...
  @override
  Widget build(BuildContext context){
  ...
  }
}
```
- ### 第二部分“_MyStatefulWidgetState”是在Widget的生命周期中变化的部分，并强制每次应用修改时重建Widget的这个特定实例。
>名称以_开头的字符使其成为.dart文件的私有。
如果需要在.dart文件之外引用此类，请不要使用“_”前缀。

- ### _MyStatefulWidgetState类可以访问存储在MyStatefulWidget中的任何变量，使用widget.{变量的名称}。
>例如：widget.color


__(三)Widget唯一标识 - key__
- ### 在Flutter中，每个Widget都是唯一标识的。这个唯一标识由构建/渲染时的框架定义。
- ### 此唯一标识对应于可选的Key参数。如果省略，Flutter将为您生成一个。
- ### 在某些情况下，您可能需要强制使用此密钥，以便可以通过其密钥访问窗口Widget。
- ### 为此，您可以使用以下帮助程序之一：GlobalKey ，LocalKey，UniqueKey 或ObjectKey。


### 该GlobalKey确保关键是在整个应用程序唯一的。
### 强制使用Widget的唯一标识：
```
GlobalKey myKey = new GlobalKey();
...
@override
Widget build(BuildContext context){
  return new MyWidget(
      key: myKey
  );
}
```
__———第2部分：如何进入State？———__
>如前所述，State链接到一个BuildContext，BuildContext链接到Widget的一个实例。

### 1. Widget本身
- ### 理论上，唯一能够访问状态的是Widget State本身。
- ### 在这种情况下，没有困难。Widget State类访问其任何变量。

### 2. 一个直接的 child Widget
- ### 有时，父窗口Widget可能需要访问其直接子节点的状态才能执行特定任务。
- ### 在这种情况下，要访问这些直接子项State，您需要了解它们。

>给某人打电话的最简单方法是通过一个名字。在Flutter中，每个Widget都有一个唯一的标识，由框架在构建/渲染时确定。如前所示，您可以使用key参数强制使用Widget的标识。
```
...
GlobalKey<MyStatefulWidgetState> myWidgetStateKey = new GlobalKey<MyStatefulWidgetState>();
...
@override
Widget build(BuildContext context){
  return new MyStatefulWidget(
    key: myWidgetStateKey,
    color: Colors.blue,
  );
}
```
### 一旦确定，父Widget可以通过以下方式访问其子级的状态：
### myWidgetStateKey.currentState

### 让我们考虑一个基本示例，当用户点击按钮时显示SnackBar。
### 由于SnackBar是Scaffold的子Widget，它不能直接被Scaffold身体的任何其他孩子访问（还记得上下文的概念及其层次结构/树结构吗？）。因此，访问它的唯一方法是通过ScaffoldState，它公开一个公共方法来显示SnackBar。
```
class _MyScreenState extends State<MyScreen> {
  /// the unique identity of the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('My Screen'),
      ),
      body: new Center(
        new RaiseButton(
            child: new Text('Hit me'),
            onPressed: (){
              _scaffoldKey.currentState.showSnackBar(
                  new SnackBar(
                    content: new Text('This is the Snackbar...'),
                  )
              );
            }
        ),
      ),
    );
  }
}
```
### 假设您有一个属于另一个Widget的子树的Widget，如下图所示。为了实现这一目标，需要满足3个条件:
1. __带状态的Widget”（红色）需要暴露其State__
### 为了公开它的状态，Widget需要在创建时记录它，如下所示：
```
class MyExposingWidget extends StatefulWidget {

  MyExposingWidgetState myState;

  @override
  MyExposingWidgetState createState(){
    myState = new MyExposingWidgetState();
    return myState;
  }
}
```
2. __Widget State”需要暴露一些getter / setter__
### 为了让“stranger”设置/获取状态属性，Widget State需要通过以下方式授权访问：

>公共属性 （不推荐）
>getter / setter
例如：
```
class MyExposingWidgetState extends State<MyExposingWidget>{
  Color _color;

  Color get color => _color;
  ...
}
```
3. __想要获得State的Widget”（上图中蓝色的widget）需要引用State__
```
class MyChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final MyExposingWidget widget = context.ancestorWidgetOfExactType(MyExposingWidget);
    final MyExposingWidgetState state = widget?.myState;
    return new Container(
      color: state == null ? Colors.blue : state.color,
    );
  }
}
```
>这个解决方案很容易实现，但子窗口Widget如何知道它何时需要重建？在这个解决方案，它不知道。它必须等待重建才能刷新其内容，这不是很方便。下一节将讨论Inherited Widget的概念，它可以解决这个问题。

## 3. InheritedWidget
---
__InheritedWidget允许在窗口Widget树中有效地传播（和共享）信息。__
__InheritedWidget是一个特殊的Widget，您可以将其作为另一个子树的父级放在Widgets树中。该子树的所有Widget都必须能够与该InheritedWidget公开的数据进行交互。__
为了解释它，让我们看下代码：
```
class MyInheritedWidget extends InheritedWidget {
  MyInheritedWidget({
    Key key,
    @required Widget child,
    this.data,
  }): super(key: key, child: child);

  final data;

  static MyInheritedWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyInheritedWidget);
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) => data != oldWidget.data;
}
```
- ### 此代码定义了一个名为“MyInheritedWidget”的Widget，旨在“共享”所有Widget（与子树的一部分）中的某些数据。
- ### 如前所述，为了能够传播/共享一些数据，需要将InheritedWidget定位在窗口Widget树的顶部，这解释了传递给InheritedWidget基础构造函数的“@required Widget child”。
- ### “static MyInheritedWidget（BuildContext context）”方法允许所有子窗口Widget获取最接近上下文的MyInheritedWidget的实例（参见后面）
### 最后，“updateShouldNotify”重写方法用于告诉InheritedWidget是否必须将通知传递给所有子窗口Widget（已注册/已订阅），如果对数据应用了修改（请参阅下文）。

因此，我们需要将它放在树节点级别，如下所示：
```
class MyParentWidget... {
...
@override
Widget build(BuildContext context){
return new MyInheritedWidget(
data: counter,
child: new Row(
children: <Widget>[
...
],
),
);
}
}
```
### 子child如何访问InheritedWidget的数据？
### 在构建子child时，后者将获得对InheritedWidget的引用，如下所示：
```
class MyChildWidget... {
...

@override
Widget build(BuildContext context){
final MyInheritedWidget inheritedWidget = MyInheritedWidget.of(context);

/// 从此刻开始，窗口Widget可以使用MyInheritedWidget公开的数据
/// 通过调用：inheritedWidget.data
return new Container(
color: inheritedWidget.data.color,
);
}
}
```
### 如何在Widget之间进行交互？
请考虑以下显示窗口Widget树结构的图表。

###  为了说明一种交互方式，我们假设如下：
- ### WidgetA’是一个将项目添加到购物车的按钮;
- ### WidgetB”是一个显示购物车中商品数量的文本;
- ### WidgetC”位于WidgetB旁边，是一个内部带有任何文本的文本;
- ### 我们希望“Widget B”在按下“Widget A”时自动在购物车中显示正确数量的项目，但我们不希望重建“Widget C”
- ### InheritedWidget就是用来干这个的Widget！

### 代码示例我们先写下代码，然后解释如下：
```
class Item {
  String reference;

  Item(this.reference);
}

class _MyInherited extends InheritedWidget {
  _MyInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final MyInheritedWidgetState data;

  @override
  bool updateShouldNotify(_MyInherited oldWidget) {
    return true;
  }
}

class MyInheritedWidget extends StatefulWidget {
  MyInheritedWidget({
    Key key,
    this.child,
  }): super(key: key);

  final Widget child;

  @override
  MyInheritedWidgetState createState() => new MyInheritedWidgetState();

  static MyInheritedWidgetState of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(_MyInherited) as _MyInherited).data;
  }
}

class MyInheritedWidgetState extends State<MyInheritedWidget>{
  /// List of Items
  List<Item> _items = <Item>[];

  /// Getter (number of items)
  int get itemsCount => _items.length;

  /// Helper method to add an Item
  void addItem(String reference){
    setState((){
      _items.add(new Item(reference));
    });
  }

  @override
  Widget build(BuildContext context){
    return new _MyInherited(
      data: this,
      child: widget.child,
    );
  }
}

class MyTree extends StatefulWidget {
  @override
  _MyTreeState createState() => new _MyTreeState();
}

class _MyTreeState extends State<MyTree> {
  @override
  Widget build(BuildContext context) {
    return new MyInheritedWidget(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Title'),
        ),
        body: new Column(
          children: <Widget>[
            new WidgetA(),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.shopping_cart),
                  new WidgetB(),
                  new WidgetC(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return new Container(
      child: new RaisedButton(
        child: new Text('Add Item'),
        onPressed: () {
          state.addItem('new item');
        },
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return new Text('{state.itemsCount}');
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Text('I am Widget C');
  }
}
```
说明

在这个非常基本的例子中，

- ### _MyInherited是一个InheritedWidget，每次我们通过点击“Widget A”按钮添加一个Item时都会重新创建它

- ### MyInheritedWidget是一个Widget，其状态包含Items列表。可以通过“（BuildContext context）的静态MyInheritedWidgetState”访问此状态。

- ### MyInheritedWidgetState公开一个getter（itemsCount）和一个方法（addItem），以便它们可以被Widget使用，这是子Widget树的一部分

- ### 每次我们向State添加一个Item时，MyInheritedWidgetState都会重建

- ### MyTree类只是构建一个Widget树，将MyInheritedWidget作为树的父级

- ### WidgetA是一个简单的RaisedButton，当按下它时，从最近的MyInheritedWidget调用addItem方法

- ### WidgetB是一个简单的文本，显示最接近的MyInheritedWidget级别的项目数

### 这一切如何运作？
__注册Widget以供以后通知__

__当子Widget调用MyInheritedWidget.of（context）时，它会调用MyInheritedWidget的以下方法，并传递自己的BuildContext。__
```
static MyInheritedWidgetState of(BuildContext context) {
return (context.inheritFromWidgetOfExactType(_MyInherited) as _MyInherited).data;
}
```
### 在内部，除了简单地返回MyInheritedWidgetState的实例之外，它还将消费者窗口Widget订阅到更改通知。

### 在场景后面，对这个静态方法的简单调用实际上做了两件事：
- ### 当对InheritedWidget应用修改时，“consumer”窗口Widget会自动添加到将重建的订户列表中（此处为_MyInherited）
- ### MyInheritedWidget（又名MyInheritedWidgetState）中引用的数据将返回给“使用者”
## 5.过程
---

### 由于’Widget A’和’Widget B’都已使用InheritedWidget订阅，因此如果对_MyInherited应用了修改，则当单击Widget A的RaisedButton时，操作流程如下（简化版本）：

-  ### 调用MyInheritedWidgetState的addItem方法
-  ### MyInheritedWidgetState.addItem方法将新项添加到List
-  ### 调用setState（）以重建MyInheritedWidget
-  ### 使用List 的新内容创建_MyInherited的新实例
-  ### _MyInherited记录在参数（数据）中传递的新State作为InheritedWidget，它检查是否需要“通知”“使用者”（答案为是）
-  ### 它迭代整个消费者列表（这里是Widget A和Widget B）并请求他们重建
-  ### 由于Wiget C不是消费者，因此不会重建。
嗯，就是这么干的 !

### 但是，Widget A和Widget B都重建了，而重建Wiget A没用，因为它没有任何改变。如何防止这种情况发生？
__在仍然访问“继承的”小组件时阻止某些小组件重建__

### Widget A也被重建的原因来自它访问MyInheritedWidgetState的方式。

> 正如我们之前看到的，调用context.inheritFromWidgetOfExactType()方法的实际上是自动将Widget订阅到“使用者”列表。
> 防止此自动订阅同时仍允许Widget A访问MyInheritedWidgetState的解决方案是更改MyInheritedWidget的静态方法，如下所示：
```
static MyInheritedWidgetState of([BuildContext context, bool rebuild = true]){
return (rebuild ? context.inheritFromWidgetOfExactType(_MyInherited) as _MyInherited
    : context.ancestorWidgetOfExactType(_MyInherited) as _MyInherited).data;
}
```
### 通过添加布尔类型的额外参数…

- ### 如果“rebuild”参数为true（默认情况下），我们使用常规方法（并且Widget将添加到订阅者列表中）
- ### 如果“rebuild”参数为false，我们仍然可以访问数据，但不使用InheritedWidget的内部实现
### 因此，要完成解决方案，我们还需要稍微更新Widget A的代码，如下所示（我们添加false额外参数）：
```
class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context, false);
    return new Container(
      child: new RaisedButton(
        child: new Text('Add Item'),
        onPressed: () {
          state.addItem('new item');
        },
      ),
    );
  }
}
```
### 在那里，当我们按下它时，Widget A不再重建。
### Routes, Dialogs的特别说明…
>路由Routes，对话框Dialogs , BuildContexts与应用程序绑定。这意味着即使在屏幕A内部您要求显示另一个屏幕B（例如，在当前的屏幕上），两个屏幕中的任何一个都没有“简单的方法”来关联它们自己的上下文。屏幕B了解屏幕A上下文的唯一方法是从屏幕A获取它作为Navigator.of（context）.push（…。）的参数。

''';

