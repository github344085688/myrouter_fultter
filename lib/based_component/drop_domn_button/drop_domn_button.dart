import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'explain.dart';

class DropDomnButton extends StatefulWidget {
  const DropDomnButton({Key key}) : super(key: key);

  @override
  _DropDomnButton createState() => _DropDomnButton();
}

class _DropDomnButton extends State<DropDomnButton> {
  static const menuItems = <String>[
    'One',
    'Two',
    'Three',
    'Four',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) =>
        DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
  )
      .toList();

  String _btn2SelectedVal;
  dynamic _value;

  @override
  Widget build(BuildContext context) =>
     Scrollbar(
              child: SingleChildScrollView(
                  padding:EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetMarkdown(data: '''
```           
DropdownButton({
    Key key,
    @required this.items,       // 下拉选项列表
    this.selectedItemBuilder,   // 选项 item 构造器
    this.value,                 // 选中内容
    this.hint,                  // 启动状态下默认内容
    this.disabledHint,          // 禁用状态下默认内容
    @required this.onChanged,   // 选择 item 回调
    this.elevation = 8,         // 阴影高度
    this.style,                 // 选项列表 item 样式
    this.underline,             // 按钮下划线
    this.icon,                  // 下拉按钮图标
    this.iconDisabledColor,     // 禁用状态下图标颜色
    this.iconEnabledColor,      // 启动时图标颜色
    this.iconSize = 24.0,       // 图标尺寸
    this.isDense = false,       // 是否降低按钮高度
    this.isExpanded = false,    // 是否将下拉列表内容设置水平填充
})
```
```
const DropdownMenuItem({
    Key key,
    this.value,             // 对应选中状态内容
    @required this.child,   // 下拉列表 item 内容
})
```

              '''),
                      DropdownButton(
                        value: _btn2SelectedVal,
                        isExpanded: true,
                        hint: Text('Choose'),
                        onChanged: ((String newValue) {
                          setState(() {
                            _btn2SelectedVal = newValue;
                          });
                        }),
                        items: _dropDownMenuItems,
                      ),
                      ListTile(
                        title: Text('DropDownButton with hint:'),
                        trailing: DropdownButton(
                          value: _btn2SelectedVal,
                          hint: Text('Choose'),
                          onChanged: ((String newValue) {
                            setState(() {
                              _btn2SelectedVal = newValue;
                            });
                          }),
                          items: _dropDownMenuItems,
                        ),
                      ),
                      DropdownButton(
                          value: _value,
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                          icon: Icon(Icons.arrow_right),
                          iconSize: 40,
                          iconEnabledColor: Colors.green.withOpacity(0.7),
                          hint: Text('请选择地区'),
                          isExpanded: true,
                          underline: Container(
                              height: 1, color: Colors.green.withOpacity(0.7)),
                          items: [
                            DropdownMenuItem(
                                child: Row(children: <Widget>[
                                  Text('北京'),
                                  SizedBox(width: 10),
                                  Icon(Icons.ac_unit)
                                ]),
                                value: 1),
                            DropdownMenuItem(
                                child: Row(children: <Widget>[
                                  Text('天津'),
                                  SizedBox(width: 10),
                                  Icon(Icons.content_paste)
                                ]),
                                value: 2),
                            DropdownMenuItem(
                                child: Row(children: <Widget>[
                                  Text('河北', style: TextStyle(
                                      color: Colors.purpleAccent, fontSize: 16)),
                                  SizedBox(width: 10),
                                  Icon(Icons.send, color: Colors.purpleAccent)
                                ]),
                                value: 3),

                          ],
                          onChanged: (value) => setState(() => _value = value)),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: double.infinity,
                          maxHeight: double.infinity,
                        ),

                      ),
                    ],
                  )
              ),
            );



}
