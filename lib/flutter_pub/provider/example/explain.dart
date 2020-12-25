
const String PROVIDEREXAMPLE = """
- 我们要监听改变就要在MyApp()外面套一层，这个是全局的，于是如下
```
import 'package:provider/provider.dart';
Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider.value(value: Counter(1))
        ],
        child: _MyMainApp()
    )

```
- 如果想管理多个对象可以用MultiProvider,如下
```
MultiProvider(
  providers: [
    Provider<genreType>.value(value: user()),
    Provider<genreType>.value(value: goods()),
    .....
  ],
  child: someWidget,
)
```
### child: Text(Provider.of<Counter>(context).count.toString())

```
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  //1
  int _count;
  Counter(this._count);

  void add() {
    _count++;
    notifyListeners(); //2
  }

  get count => _count; //3
}
```
```
onPressed: () {
  Provider.of<Counter>(context, listen: false).add();
  controller.animateTo(0,
  duration: Duration(seconds: 1), curve: Curves.easeOut);
  }
```
## 获取Provider数据，
  > Widget build(BuildContext context){
  > final providerCounter =  Provider.of<Counter>(context, listen: false).count;
""";