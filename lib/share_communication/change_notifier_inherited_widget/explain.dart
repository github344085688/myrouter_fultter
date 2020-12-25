
const String CHANGENOTIFIERINHERITEDWIDGET = '''

## callback 回调通信
 父组件调用子组件就用callBack 
```
移动开发Flutter中常见的ChangeNotifier和InheritedWidget
2019年11月18日 ⁄ 移动开发 ⁄ 共 1176字	⁄ 字号 小 中 大 ⁄ 评论关闭
　　ChangeNotifier 模式在 Flutter 中是十分常见的，比如 TextField 控件中，通过 TextEditingController 可以快速设置值的显示，这是为什么呢?

　　这是因为 TextEditingController 它是 ChangeNotifier 的子类，而 TextField 的内部对其进行了 addListener，同时我们改变值的时候调用了notifyListener，触发内部 setState。

　　InheritedWidget

　　在 Flutter 中所有的状态共享都是通过它实现的，如自带的 Theme ，Localizations ，或者状态管理的 scoope_model 、 flutter_redux 等等，都是基于它实现的。

　　如下图是 SliderTheme 的自定义实现逻辑，默认 Theme 中是包含了 SliderTheme，但是我们可以通过覆盖一个新的 SliderTheme 嵌套去实现自定义，然后通过 SliderTheme theme = SliderTheme(context); 获取，其中而 context 的实现就是 Element。

　　在 Element 的 inheritFromWidgetOfExactType 方法实现里，有一个 Map _inheritedWidgets 的对象。

　　_inheritedWidgets 一般情况下是空的，只有当父控件是 InheritedWidget 或者本身是 InheritedWidgets 时才会有被初始化，而当父控件是 InheritedWidget 时，这个 Map 会被一级一级往下传递与合并 。 所以当我们通过 context 调用 inheritFromWidgetOfExactType 时，就可以往上查找到父控件的 Widget 。

　　StreamBuilder

　　StreamBuilder 一般用于通过 Stream 异步构建页面的，如下图所示，通过点击之后，绿色方框的文字会变成 addNewxxx，因为 Stream 进行了 map 变化，同时一般实现 bloc 模式的时候，经常会用到它们。

　　类似的还有 FutureBuilder2.4、State 中的参数使用

　　一般 Widget 都是一帧的，而 State 实现了 Widget 的跨帧绘制，一般定义的时候，我们可以如下图一样实现，而如下图尖头所示，这时候我们点击 setState 改变的时候，是不会出现效果的，为什么呢?

　　其实 State 对象的创建和更新时机导致的：

　　1、createState 只在 StatefulElement 创建时才会被创建的。

　　2、StatefulElement 的 createElement 一般只在 inflateWidget 调用。

　　3、updateChild 执行 inflateWidget 时， 如果 child 存在可以更新的话，不会执行 inflateWidget。
''';
