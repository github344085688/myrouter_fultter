
const String BASEDONUSING = '''
## 1. Navigate到第二个route使用Navigator.push()
```
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondRoute()),
  );
}
```
1-2. 返回到第一个route使用Navigator.pop()
```
onPressed: () {
  Navigator.pop(context);
}
```
1-3. 使用Navigator.pop()来返回上一个页面
我们使用Navigator.pop()来退出SecondRoute并回到FirstRoute，pop()方法回将当前路由从Route栈中移除

## 2.通过Named Routes（路由表）来做跳转 我们要使用Navigator.pushNamed()函数
```
MaterialApp(
  // 定义APP启动时第一个显示的页面，在本例中，initialRoute指代FirstScreen
  initialRoute: '/',
  routes: {
    // 当navigating到‘/’ route时，构建FirstScreen widget
    '/': (context) => FirstScreen(),
    // 当navigating 到"/second" route, 构建SecondScreen widget.
    '/second': (context) => SecondScreen(),
  },
```
可以看出使用Named Routes的时候只是给每个Route定义了一个别名，这样我们就可以根据这个别名来进行跳转了
```
onPressed: () {
  // 跳转到SecondScreen
  Navigator.pushNamed(context, '/second');
}
  Navigator.pop(context);
```
## 2.1.准备传递的数据
首先，我们定义好要传递的数据。这里我们传递两个参数
``` class ScreenArguments {
  final String title;
  final String message;
 
  ScreenArguments(this.title, this.message);
}
```
## 2.2.创建一个页面来接受传递的数据
创建一个新的页面来接受传递的参数并显示。至于我们上面提到的如何来获取arguments，我们使用ModalRoute.of()就可以啦。这个方法3可以拿到当前路由携带的参数
```
class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';
 
  @override
  Widget build(BuildContext context) {
    //获取传递的参数
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
 
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}
```
## 2.3.注册新的页面
````
MaterialApp(
  routes: {
    ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
  },     
);
````
一切准备就绪，我们使用pushNamed来实现跳转，并将准备好的参数传递过去
````
RaisedButton(
  child: Text("使用pushNamed携带参数跳转"),
  onPressed: () {
    //点击事件，触发跳转
    Navigator.pushNamed(
      context,
      ExtractArgumentsScreen.routeName,
      arguments: ScreenArguments(
        '我是被传递的title',
        '我是被传递的message.',
      ),
    );
  },
);
````
如果使用Navigator.push()传递参数
````Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ExtractArgumentsScreen(),
        settings: RouteSettings(
            arguments: ScreenArguments(
                '我是title',
                '我是message.',
             ),
         ),
     ),
   );
````
## 2.5.跳转的另外一种方式 我们也可以使用onGenerateRoute来进行跳转传值。
并且封装成一个ScreenArguments实体类，接受参数的页面需要增加一个构造方法来接收这两个值
```
class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';
 
  final String title;
  final String message;
 
  //定义一个构造方法
  const PassArgumentsScreen({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
```
```
MaterialApp(
  
  onGenerateRoute: (settings) {
    // 判断当前route，分别进行处理
    if (settings.name == PassArgumentsScreen.routeName) {
      // 将settings.arguments转换为正确的类型 ScreenArguments.
      final ScreenArguments args = settings.arguments;
 
      //通过构造方法传值
      return MaterialPageRoute(
        builder: (context) {
          return PassArgumentsScreen(
            title: args.title,
            message: args.message,
          );
        },
      );
    }
  },
);
Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ExtractArgumentsScreen(),
        settings: RouteSettings(
            arguments: ScreenArguments(
                '我是title',
                '我是message.',
             ),
         ),
     ),
   );
```
````
final routes={
  '/':(context)=>Tabs(),
  '/form':(context)=>FormPage(),
  '/search':(context,{arguments})=>SearchPage(arguments:arguments),
};

//Navigator.pushNamed 调用（在router跳转时候调用发生。）
var onGenerateRoute=(RouteSettings settings) {
  final String name = settings.name;
  //outer跳转时候匹配Widget,
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    //在router跳转时候处理arguments
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    }else{
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context));
      return route;
    }
  }
};
````
## 4.携带参数退出
- 创建一个页面，名叫HomeScreen并添加一个按钮跳转到SelectionScreen
- 创建SelectionScreen，这个页面包含两个按钮，点击后的效果都是退出页面并携带不同的返回值
- 在HomeScreen中接收返回值，并用一个Snackbar显示
# 4.1 创建一个页面，名叫HomeScreen并添加一个按钮跳转到SelectionScreen
```
class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option!'),
    );
  }
 
  //点击跳转到SelectionScreen并接收返回值
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
 
//调用Navigator.push()会返回一个Furture，根据这个Future可以接收页面返回的参数，这个下面再讲
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );
  }
}
```
# 4.2 创建SelectionScreen，这个页面包含两个按钮，点击后的效果都是退出页面并携带不同的返回值
```

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 退出页面，并携带一个返回值‘Yep!' 
                  Navigator.pop(context, 'Yep!');
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 退出页面，并携带一个返回值 "Nope"
                  Navigator.pop(context, 'Nope!');
                },
                child: Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```
# 在HomeScreen中接收返回值，并用一个Snackbar显示
```
_navigateAndDisplaySelection(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SelectionScreen()),
  );
 
  String value = result as String;
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("value")));
}
```


    ''';
