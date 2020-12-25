const String DROPDOMNBUTTON = """
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

const DropdownMenuItem({
    Key key,
    this.value,             // 对应选中状态内容
    @required this.child,   // 下拉列表 item 内容
})
```
""";