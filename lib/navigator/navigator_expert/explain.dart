
const String NAVIGATOREXPERT = '''

## 1.PushAndRemove 销毁之前所有页面
商品列表页，商品详情页，支付页面，支付结果页。，当跳转到支付结果页的时候将之前所有的页面都销毁，只留下主页面。
- 新建4个页面，Screen1，Screen2，Screen3，Screen4
- 在MaterialApp中添加这4个页面的路由
- 使用Navigator.of(context).pushAndRemoveUntil()或者Navigator.of(context).pushNamedAndRemoveUntil()进行跳转

```
child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/screen2');
        },
        

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes: {
      '/screen1': (context) => Screen1(),
      '/screen2': (context) => Screen2(),
      '/screen3': (context) => Screen3(),
      '/screen4': (context) => Screen4(),
    },
    initialRoute: '/screen1',
  );
}
```
### 本例中我们的跳转顺序是Screen1—>Screen2—>Screen3—>Screen4
### 当从Screen3跳转到Screen4的时候我们希望将Screen2，Screen3从栈里面移除掉，这样在Screen4点击返回就能直接回到Screen1
### 使用Navigator.pushAndRemoveUtil()或者Navigator.pushNamedAndRemoveUntil()实现，这个方法有两个必传参数newRoute和predicate，第一个参数表示将要加入栈中的页面，第二个参数表示栈中要保留的页面底线，意思就是在predicate和newRoute之间的页面都会被移除栈
##      跳转到screen4，并且移除所有的页面直到screen1
##      Navigator.of(context).pushNamedAndRemoveUntil(
##              '/screen4', ModalRoute.withName('/screen1'));
```
class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {    
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Screen4()),
              ModalRoute.withName('/screen1'));
 
        },
        child: Text(
          'screen3',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
 
```


## 2.pushReplacement
#### 假设我们在做一个登录功能，在登录成功后需要跳转到一个新的页面并且销毁当前登录页，这时候就可以用pushReplacement来实现，从字面上的意思看push很好理解，把一个新页面压入栈中嘛，replacement到底是替代那个页面呢？答案是当前页，因为被替换的对象是固定的，所以该方法的必传参数只有被push的路由。
## //打开Screen4页面，并销毁当前页
#          Navigator.of(context).pushReplacementNamed('/screen4');
## //也可以使用以下方式replacement替代当前页
# //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Screen3()));
```
class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          //打开Screen4页面，并销毁当前页
          Navigator.of(context).pushReplacementNamed('/screen4'); 
          //也可以使用以下方式
         //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Screen3()));
        },
        child: Text(
          'screen3',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
```

## 3.popUntil
这个比较简单，从字面意思上就可以看出是“一直退出直到某一个页面”，来看一下用法吧
```
class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          //当前在Screen4页面，点击回到Screen1，连带着Screen2，Screen3也一起退出
          Navigator.of(context).popUntil(ModalRoute.withName('/screen1'));
        },
        child: Text(
          'screen4',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
```

## 4.popAndPushNamed
这个方法和pushReplacement很相近，都是开启一个新的页面并且销毁之前的页面，只是在逻辑上的执行顺序不一样，popAndPushNamed是退出当前页面并且将新的页面放到它原来的位置上，所以在视觉效果上是先退出再进入
```
class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          //点击退出当前页面，并将Screen3压入栈中
          Navigator.of(context).popAndPushNamed('/screen3');
        },
        child: Text(
          'screen2',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
```

仔细看动图，Screen2到Screen3的时候是先将Screen2退出再显示Screen3，它不像pushReplacement那样无感知的就把页面给替换了。所以大家根据实际场景选择使用。

备注：以上所有的方法都可以传递相应的参数，涉及到pop的可以加入返回参数，涉及到push的可以添加传递到新页面的参数，这里没有做过多的赘述，大家可以自己尝试一下。

5.maybePop和canPop
Navigator.of(context).canPop()返回一个bool值，表示当前页面是否可以退出，那么判断的依据是啥呢？追溯到源码去看
/// Whether the navigator can be popped.
  ///
  /// {@macro flutter.widgets.navigator.canPop}
  ///
  /// See also:
  ///
  ///  * [Route.isFirst], which returns true for routes for which [canPop]
  ///    returns false.
  ```
  bool canPop() {
    assert(_history.isNotEmpty);
    return _history.length > 1 || _history[0].willHandlePopInternally;
  }
  ```
尤其是这句话哦： [Route.isFirst], which returns true for routes for which [canPop]，意思说的很明显了，判断依据就是看当前路由是否处在栈中“最底部”的位置。根据之前的例子，如果我们在Screen1调用canPop肯定返回false，因为它处在“最底部”的位置，而在其它页面调用则返回true

Navigator.of(context).maybePop()是一种很友善的退出方式，如果能退出就退出，不退出拉到。其实这个方法可以理解为
maybePop() => canPop() == true?pop() : do nothing

所以在首页调用maybePop()是不会退出的，如果在其它页面调用，效果和pop()一样

## Navigator 继承自 StatefulWidget，它也是小组件，它有很多相关静态函数，可以帮我们达到页面跳转和数据交互的功能：
- push 将设置的router信息推送到Navigator上，实现页面跳转。
- of 主要是获取 Navigator最近实例的好状态。
- pop 导航到新页面，或者返回到上个页面。
- canPop 判断是否可以导航到新页面
- maybePop 可能会导航到新页面
- popAndPushNamed 指定一个路由路径，并导航到新页面。
- popUntil 反复执行pop 直到该函数的参数predicate返回true为止。
- pushAndRemoveUntil 将给定路由推送到Navigator，删除先前的路由，直到该函数的参数predicate返回true为止。
- pushNamed 将命名路由推送到Navigator。
- pushNamedAndRemoveUntil 将命名路由推送到Navigator，删除先前的路由，直到该函数的参数predicate返回true为止。
- pushReplacement 路由替换。
- pushReplacementNamed 这个也是替换路由操作。推送一个命名路由到Navigator，新路由完成动画之后处理上一个路由。
- removeRoute 从Navigator中删除路由，同时执行Route.dispose操作。
- removeRouteBelow 从Navigator中删除路由，同时执行Route.dispose操作，要替换的路由是传入参数anchorRouter里面的路由。
- replace 将Navigator中的路由替换成一个新路由。
- replaceRouteBelow 将Navigator中的路由替换成一个新路由，要替换的路由是是传入参数anchorRouter里面的路由。

（1）使用Navigator.push实现发送路由，Navigator.pop返回上一个页面。
push函数的参数1是 上下文，参数2是 Router，我们这里使用的是 Router的孙子类（好几层继承的子类）MaterialPageRouter 这个类。该类必须要传入一个闭包函数 WidgetBuilder，该闭包函数的参数是 BuildContext对象，我们这里使用的是匿名函数的形式，加上胖箭头符号，简写成这样：builder: (context) => new App(); 相信大家看到这里也基本能看明白这句表达式的含义。返回上一个页面使用 Navigator.pop(context);

第一点：push使用
1.pushNamed——Navigator.of(context).pushNamed(‘routeName’);
### 此种方法只是简单的将我们需要进入的页面push到栈顶，以此来显示当前页面,其参数是一个字符串类型，传入的是页面对应的路由名称
### 使用：Navigator.of(context).pushNamed(’/screen1’); 直接进入screen1页面（每次都将新建一个新的页面）
2.1 pushReplacementNamed——Navigator.of(context).pushReplacementNamed(’/screen4’);
指把当前页面在栈中的位置替换成跳转的页面（替换导航器的当前路由，通过推送路由[routeName]），当新的页面进入后，之前的页面将执行dispose方法。
### 即比如当前从页面1进入页面2，在页面2使用
### Navigator.of(context).pushReplacementNamed(’/screen3’);进入页面3，当进入了页面3后，页面2将执行dispose方法，此时在页面3返回时，会回到页面1.
使用情况：例如
从SplashScreen到HomeScreen。它应该只显示一次，用户不应该再从主屏幕回到它。在这种情况下，由于我们将要进入一个全新的屏幕，
我们可能想要使用这个方法来实现它的enter animation属性。

2.2 pushReplacement——Navigator.pushReplacement( context, MaterialPageRoute(builder: (BuildContext context) => screen4()));
这个用法跟2.1相同，只是路由的传递有差别，上方的是传递路由名称（页面对应的名称，需在入口定义（本文第一点）），而后者只需new对应页面即可，而且可以传递
参数（传参方式类似于本文后续所说的传递方法）。

3.popAndPushNamed——Navigator.popAndPushNamed(context, ‘/screen4’);
指将当前页面pop，然后跳转到制定页面（将当前路由弹出导航器，并将命名路由推到它的位置。）
下面为官方说明：

Pop the current route off the navigator that most tightly encloses the
given context and push a named route in its place.
使用情况：例如
在购物应用中，有产品列表，用户在产品列表中可以通过筛选，来进一步选择商品，在这个过程中，用户点击筛选按钮时，会进入筛选条件选择界面，当用户点击
确定筛选按钮时，应弹出筛选界面，并使用新的筛选条件进入产品列表。这种情况popAndPushNamed就更合适了。

4.pushNamedAndRemoveUntil——Navigator.of(context).pushNamedAndRemoveUntil(’/screen4’, (Route route) => false);
指将制定的页面加入到路由中，然后将其他所有的页面全部pop, (Route route) => false将确保删除推送路线之前的所有路线。
这时候将打开一个新的screen4页面

Push the route with the given name onto the navigator, and then remove all
the previous routes until the predicate returns true.
使用情况：例如
当用户点击了退出登录时，我们需要进入某一个页面（比如点退出登录后进入了登录页），这个时候用户点击返回时不应该能进入任何一个页面，这种情况就可以使用。

5.1 pushNamedAndRemoveUntil——Navigator.of(context).pushNamedAndRemoveUntil(’/screen4’, ModalRoute.withName(’/screen1’));
指将制定的页面加入到路由中，然后将之前的路径移除知道制定的页面为止（将具有给定名称的路由推到导航器上，然后删除所有路径前面的路由直到’predicate’返回true为止。）
这时候将销毁栈内除了screen4的页面，点击直接去栈内screen4，这时screen4会重新build

Push the route with the given name onto the navigator, and then remove all
the previous routes until the predicate returns true.
使用情况：例如
一个购物应用程序的例子!或者任何需要支付交易的应用程序。因此，在这些应用程序中，一旦用户完成了支付事件，所有与交易或购物车相关的屏幕都应该从堆栈中删除，用户应该进入到支付确认页面。单击back按钮应将它们返回到产品列表或主屏幕。
使用实例：
1–>2–>3,3到4时使用Navigator.pushNamedAndRemoveUntil(context,"/screen4",ModalRoute.withName(’/screen1’));
这时候如果在页面4点击返回，将会直接退出程序。
1–>2–>3,3到4时使用Navigator.pushNamedAndRemoveUntil(context,"/screen4",ModalRoute.withName(’/’));
这时候如果在页面4点击返回，将会直接回到页面1。
1–>2–>1–>2–>3,3到4时使用Navigator.pushNamedAndRemoveUntil(context,"/screen4",ModalRoute.withName(’/screen1’));
这时候如果在页面4点击返回，将会回到第二个1页面。

5.2

Navigator.pushAndRemoveUntil(
context,
MaterialPageRoute(builder: (BuildContext context) => new screen4()),
ModalRoute.withName(’/’),
这种方法跟上述方法作用相同，不同之处在于，上述传递的是路由名称，这个名称需要你在入口处进行路由指定，而这种则无需指定，直接new 出来即可，
而且可以传递参数。（看其名称即可发现差别pushNamedAndRemoveUntil与pushAndRemoveUntil）使用这种作用如下
1–>2–>3,3到4时使用此方法，这时候如果在页面4点击返回，将会直接回到页面1。

如果使用

Navigator.pushAndRemoveUntil(
context,
MaterialPageRoute(builder: (BuildContext context) => Screen4()),
(Route route) => false,
);
这时候进入4后。4将成为唯一的一个页面。其他页面都将pop出栈，这个跟上述pushNamedAndRemoveUntil也一致。

6.popUntil——Navigator.popUntil(context, ModalRoute.withName(’/screen2’));
有些应用场景下，用户可能不得不填写一个由三部分组成的长表单，该表单可能在移动应用程序的三个连续屏幕中显示。现在在表单的第三个页面，用户决定取消填写表单。用户单击Cancel，就会弹出所有之前的与表单相关的屏幕，并将用户带回主屏幕，从而丢失所有与表单相关的数据(在这种情况下，这是我们想要的)。我们不会在这里推出任何新东西，只是回到以前的路线。

第二点 pop
1.Navigator.of(context).maybePop();
maybePop 会自动进行判断，如果当前页面pop后，会显示其他页面，不会出现问题，则将执行当前页面的pop操作
否则将不执行。

2.Navigator.of(context).canPop();
canPop 判断当前页面能否进行pop操作，并返回bool值
3.Navigator.of(context).pop();
直接退出当前页面


# Flutter命名路由报错-Closure call with mismatched arguments:function 'routes.<anonymous closure>'
#【解决方案】

routes必须要带上参数，否则会报错，如下所示：

1
## final routes = {  "/":(content,{arguments}) => Tabs(),  "/form":(content, {arguments}) => FormPage(),  "/order":(content, {arguments}) => OrderPage(),  "/product":(content, {arguments}) => ProductPage(),  "/search":(content,{arguments}) => SearchPage(arguments:arguments),};
''';
