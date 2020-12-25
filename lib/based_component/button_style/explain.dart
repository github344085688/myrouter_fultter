
const String BUTTONSTYLE = """
```
RaisedButton({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,//水波纹高亮变化回调,按下返回true,抬起返回false
    ButtonTextTheme textTheme,//按钮的主题
    Color textColor,//文字的颜色
    Color disabledTextColor,//按钮禁用时候文字的颜色
    Color color,//按钮的背景颜色
    Color disabledColor,//按钮被禁用的时候显示的颜色
    Color highlightColor,//点击或者toch控件高亮的时候显示在控件上面，水波纹下面的颜色
    Color splashColor,//水波纹的颜色
    Brightness colorBrightness,//按钮主题高亮
    double elevation,//按钮下面的阴影
    double highlightElevation,//高亮时候的阴影
    double disabledElevation,//按下的时候的阴影
    EdgeInsetsGeometry padding,
    ShapeBorder shape,//设置形状
    Clip clipBehavior = Clip.none,
    MaterialTapTargetSize materialTapTargetSize,
    Duration animationDuration,
    Widget child,
})
```

   """;

