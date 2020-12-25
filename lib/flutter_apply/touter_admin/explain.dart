
const String ROUTERADMIN = '''
## 路由管理
```
 Navigator.push( context,
           MaterialPageRoute(builder: (context) {
              return NewRoute();
           }));
```
### 1.__MaterialPageRoute__
MaterialPageRoute继承自PageRoute类，PageRoute类是一个抽象类，表示占有整个屏幕空间的一个模态路由页面，它还定义了路由构建及切换时过渡动画的相关接口及属性。MaterialPageRoute 是Material组件库提供的组件，它可以针对不同平台，实现与平台页面切换动画风格一致的路由切换动画：
```
MaterialPageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  })
```

   - builder 是一个WidgetBuilder类型的回调函数，它的作用是构建路由页面的具体内容，返回值是一个widget。我们通常要实现此回调，返回新路由的实例。
   - settings 包含路由的配置信息，如路由名称、是否初始路由（首页）。
   - maintainState：默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为false。
   - fullscreenDialog表示新的路由页面是否是一个全屏的模态对话框，在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）。
> 如果想自定义路由切换动画，可以自己继承PageRoute来实现，我们将在后面介绍动画时，实现一个自定义的路由组件。

   
## __Navigator__
 Navigator是一个路由管理的组件，它提供了打开和退出路由页方法
 
   - __Future push(BuildContext context, Route route)__
将给定的路由入栈（即打开新的页面），返回值是一个Future对象，用以接收新路由出栈（即关闭）时的返回数据。

   - __bool pop(BuildContext context, [ result ])__
 将栈顶路由出栈，result为页面关闭时返回给上一个页面的数据。

Navigator 还有很多其它方法，如Navigator.replace、Navigator.popUntil等，

## __ 路由传值__
>  onPressed: () => Navigator.pop(context, "我是返回值"),
### 打开新路由TipRoute的代码：
```
onPressed: () async {
          // 打开`TipRoute`，并等待返回结果
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TipRoute(
                  // 路由参数
                  text: "我是提示xxxx",
                );
              },
            ),
          );
```
需要说明：
   - 提示文案“我是提示xxxx”是通过TipRoute的text参数传递给新路由页的。我们可以通过等待Navigator.push(…)返回的Future来获取新路由的返回数据。

   - 在TipRoute页中有两种方式可以返回到上一页；第一种方式时直接点击导航栏返回箭头，第二种方式是点击页面中的“返回”按钮。这两种返回方式的区别是前者不会返回数据给上一个路由，而后者会。下面是分别点击页面中的返回按钮和导航栏返回箭头后，RouterTestRoute页中print方法在控制台输出的内容：
## __命名路由__
>routes:{
   "new_page":(context) => NewRoute(),
>    ... // 省略其它路由注册信息
>  }
```
 routes:{
   "new_page":(context) => NewRoute(),
   "/":(context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
  } 
  ```
### 通过路由名打开新路由页
要通过路由名称来打开新路由，可以使用Navigator 的pushNamed方法：
  > Future pushNamed(BuildContext context, String routeName,{Object arguments})
 
### __命名路由参数传递__
> routes:{
>   "new_page":(context) => EchoRoute(),
>  } ,

__在路由页通过RouteSetting对象获取路由参数：__
> Widget build(BuildContext context) {
 //获取路由参数
>>> var args=ModalRoute.of(context).settings.arguments;

__在打开路由时传递参数__
> Navigator.of(context).pushNamed("new_page", arguments: "hi");\

## 适配
由于TipRoute接受一个text 参数
```
MaterialApp(
  ... //省略无关代码
  routes: {
   "tip2": (context){
     return TipRoute(text: ModalRoute.of(context).settings.arguments);
   },
 }, 
);
```
##  路由生成钩子 onGenerateRoute
有了onGenerateRoute回调，要实现上面控制页面权限的功能就非常容易：我们放弃使用路由表，取而代之的是提供一个onGenerateRoute回调，然后在该回调中进行统一的权限控制，如：
```
MaterialApp(
  ... //省略无关代码
  onGenerateRoute:(RouteSettings settings){
      return MaterialPageRoute(builder: (context){
           String routeName = settings.name;
       // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
       // 引导用户登录；其它情况则正常打开路由。
     }
   );
  }
);
```
>注意，onGenerateRoute只会对命名路由生效。
''';
