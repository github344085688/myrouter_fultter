
import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'explain.dart';

class InputFieldsAndForms extends StatefulWidget {
  const InputFieldsAndForms({Key key}) :super(key: key);

  @override
  _InputFieldsAndForms createState() => _InputFieldsAndForms();
}

class _InputFieldsAndForms extends State<InputFieldsAndForms> {
  TextEditingController _selectionController = TextEditingController();
  bool _numberInputIsValid = true;
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    //监听输入改变
    _selectionController.addListener(() {
      print(_selectionController.text);
    });
  }

  @override
  Widget build(BuildContext context) =>
      Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: '''
```
const TextField({
    Key key,
    this.controller,                    // 控制正在编辑文本
    this.focusNode,                     // 获取键盘焦点
    this.decoration = const InputDecoration(),              // 边框装饰
    TextInputType keyboardType,         // 键盘类型
    this.textInputAction,               // 键盘的操作按钮类型
    this.textCapitalization = TextCapitalization.none,      // 配置大小写键盘
    this.style,                         // 输入文本样式
    this.textAlign = TextAlign.start,   // 对齐方式
    this.textDirection,                 // 文本方向
    this.autofocus = false,             // 是否自动对焦
    this.obscureText = false,           // 是否隐藏内容，例如密码格式
    this.autocorrect = true,            // 是否自动校正
    this.maxLines = 1,                  // 最大行数
    this.maxLength,                     // 允许输入的最大长度
    this.maxLengthEnforced = true,      // 是否允许超过输入最大长度
    this.onChanged,                     // 文本内容变更时回调
    this.onEditingComplete,             // 提交内容时回调
    this.onSubmitted,                   // 用户提示完成时回调
    this.inputFormatters,               // 验证及格式
    this.enabled,                       // 是否不可点击
    this.cursorWidth = 2.0,             // 光标宽度
    this.cursorRadius,                  // 光标圆角弧度
    this.cursorColor,                   // 光标颜色
    this.keyboardAppearance,            // 键盘亮度
    this.scrollPadding = const EdgeInsets.all(20.0),        // 滚动到视图中时，填充边距
    this.enableInteractiveSelection,    // 长按是否展示【剪切/复制/粘贴菜单LengthLimitingTextInputFormatter】
    this.onTap,                         // 点击时回调
})
```
> controller常用于赋值和取值操作 (编辑框的控制器，跟文本框的交互一般都通过该属性完成，如果不创建的话默认会自动创建)

              '''),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                // style: Theme.of(context).textTheme.headline4,
                decoration: InputDecoration(
                  icon: Icon(Icons.attach_money),
                  labelText: 'Enter an integer:',
                  errorText:
                      _numberInputIsValid ? null : 'Please enter an integer!',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                onSubmitted: (val) {
                  print('Enter an integer----------');
                  setState(() => _numberInputIsValid = false);
                  /* Fluttertoast.showToast(
    msg: 'You entered:${int.parse(val)}',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,  // 消息框弹出的位置
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);*/
                },
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  errorText:
                      _numberInputIsValid ? null : 'Please enter an integer!',
                ),
                controller: _selectionController,
                keyboardType: TextInputType.phone,
                focusNode: focusNode1,
                onSubmitted: (val) => Fluttertoast.showToast(
                    msg: 'You entered:${int.parse(val)}',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.TOP,
                    // 消息框弹出的位置
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0),
                inputFormatters: <TextInputFormatter>[
                  BlacklistingTextInputFormatter(RegExp("[a-z]")),
                  LengthLimitingTextInputFormatter(5),
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  FilteringTextInputFormatter.deny(RegExp('[abFeG]')),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)),
                focusNode: focusNode2, //关联focusNode2
                obscureText: true,
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if (null == focusScopeNode) {
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode2);
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  ),
                ],
              ),
              WidgetMarkdown(data: '''
```
const InputDecoration({
    this.icon,//左侧外的图标
    this.labelText,//悬浮提示，可代替hintText
    this.labelStyle,//悬浮提示文字的样式
    this.helperText,//帮助文字
    this.helperStyle,
    this.hintText,//输入提示
    this.hintStyle,
    this.hintMaxLines,
    this.errorText,//错误提示
    this.errorStyle,
    this.errorMaxLines,
    this.hasFloatingPlaceholder = true,//是否显示悬浮提示文字
    this.isDense,
    this.contentPadding,//内填充
    this.prefixIcon,//左侧内的图标
    this.prefix,
    this.prefixText,//左侧内的文字
    this.prefixStyle,
    this.suffixIcon,//右侧内图标
    this.suffix,
    this.suffixText,
    this.suffixStyle,
    this.counter,//自定义计数器
    this.counterText,//计数文字
    this.counterStyle,//计数样式
    this.filled,//是否填充
    this.fillColor,//填充颜色
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.border,//边框
    this.enabled = true,
    this.semanticCounterText,
    this.alignLabelWithHint,
  }) 
```
              '''),
            ],
          ),
        ),
      );
}
