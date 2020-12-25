
const String STATEMANAGEMENTS = """
## 如果你对React/Vue的状态管理有了解，可以跳过本节
   - Widget管理自己的状态。
   - Widget管理子Widget状态。
   - 混合管理（父Widget和子Widget都管理状态。

   
如何决定使用哪种管理方法？下面是官方给出的一些原则可以帮助你做决定：
   - 如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父Widget管理。
   - 如果状态是有关界面外观效果的，例如颜色、动画，那么状态最好由Widget本身来管理。
   - 如果某一个状态是不同Widget共享的则最好由它们共同的父Widget管理。
```
    child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
      
class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
```
## 全局状态管理
   """;
