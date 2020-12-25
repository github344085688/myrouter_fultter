
const String INPUTFIELDSANDFORMS = """
## __TextField__
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

## __decoration__  ### (/输入框的装饰器，用来修改外观)

| InputDecoration({   |                          |
|---------------------|--------------------------|
|   this.icon,             |             位于装饰器外部和输入框前面的图片
|   this.labelText,           |             用于描述输入框，例如这个输入框是用来输入用户名还是密码的，当输入框获取焦点时默认会浮动到上方，
|   this.labelStyle, | // 控制labelText的样式,接收一个TextStyle类型的值
|   this.helperText,          |             辅助文本，位于输入框下方，如果errorText不为空的话，则helperText不会显示
|   this.helperStyle,          |             helperText的样式
|   this.hintText,           |             提示文本，位于输入框内部
|   this.hintStyle,          |             hintText的样式
|    this.hintMaxLines,          |             提示信息最大行数
|    this.errorText,           |             错误信息提示
|    this.errorStyle,          |             errorText的样式
|    this.errorMaxLines,            |             errorText最大行数
|    this.hasFloatingPlaceholder = true,           |             labelText是否浮动，默认为true，修改为false则labelText在输入框获取焦点时不会浮动且不显示
|    this.isDense,            |             改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小
|    this.contentPadding,          |             内间距
|    this.prefixIcon,           |             位于输入框内部起始位置的图标。
|    this.prefix,            |             预先填充的Widget,跟prefixText同时只能出现一个
|    this.prefixText,           |             预填充的文本，例如手机号前面预先加上区号等
|    this.prefixStyle,           |             prefixText的样式
|    this.suffixIcon,          |             位于输入框后面的图片,例如一般输入框后面会有个眼睛，控制输入内容是否明文
|    this.suffix,           |             位于输入框尾部的控件，同样的不能和suffixText同时使用
|    this.suffixText,         |             位于尾部的填充文字
|    this.suffixStyle,           |             suffixText的样式
|    this.counter,         |             位于输入框右下方的小控件，不能和counterText同时使用
|    this.counterText,         |             位于右下方显示的文本，常用于显示输入的字符数量
|    this.counterStyle,          |             counterText的样式
|    this.filled,           |             如果为true，则输入使用fillColor指定的颜色填充
|    this.fillColor,           |             相当于输入框的背景颜色
|    this.errorBorder,            |             errorText不为空，输入框没有焦点时要显示的边框
|    this.focusedBorder,           |             输入框有焦点时的边框,如果errorText不为空的话，该属性无效
|    this.focusedErrorBorder,           |             errorText不为空时，输入框有焦点时的边框
|    this.disabledBorder,           |             输入框禁用时显示的边框，如果errorText不为空的话，该属性无效
|    this.enabledBorder,           |             输入框可用时显示的边框，如果errorText不为空的话，该属性无效
|    this.border,          |             正常情况下的border
|    this.enabled = true,           |             输入框是否可用
|    this.semanticCounterText, | 
|    this.alignLabelWithHint,|
|  })|

   """;

const String RADIOSCHECKBOXS = """
   """;

const String RADIOSDATATABLEEXAMPLE = """
使用 DataTable就需要了解以下组件
  * DataColumn，描述数据表中的列。
  * DataRow，包含数据表中行的数据。
  * DataCell，包含数据表中单个单元格的数据。
  * PaginatedDataTable，它显示数据表中的部分数据，并提供对其余数据进行分页的控制。
  
| 属性                                   |说明                                 |
|---------------------------------------|-------------------------------------|
|DataTable |
|columns |	表中列的配置和标签  类型 List<DataColumn> |
|sortColumnIndex	 |排序的列 |
|sortAscending	 |是否按升序排序，默认true |
|rows	 |要在每一行中显示的数据 -- 不包括标题  类型 List<DataRow> |
|DataColumn |
|label	 |列标题 |
|tooltip	 |说明 |
|numeric	 |该列是否表示数值数据，默认false |
|onSort	 |用户要求使用此列对表进行排序时调用 |
|DataRow |
|selected	 |选中行，默认false |
|onSelectChanged	 |选中行监听 |
|cells	 |这一行的数据。 |
|DataCell |
|child	 |子组件 |
|placeholder	 |子组件是否实际上是占位符，默认false |
|showEditIcon	 |单元格的末尾显示编辑图标，默认false |
|onTap	 |点击 |
|PaginatedDataTable |
|header	 |表的标题 |
|actions	 |图标按钮显示在表的右上角 |
|columns	 |表中列的配置和标签  类型 List<DataColumn> |
|sortColumnIndex	 |排序的列 |
|sortAscending	 |是否按升序排序，默认true |
|onSelectAll	 |全选/全部选  操作 |
|initialFirstRowIndex	 |首次创建时显示的索引，默认0 |
|onPageChanged	 |翻页监听 |
|rowsPerPage	 |每页行数，默认defaultRowsPerPage |
|onRowsPerPageChanged	 |每页行数改变监听 |
|availableRowsPerPage	 |为用户提供每页行数选择 |
|dragStartBehavior	 |默认DragStartBehavior.start |
|source	 | 数据源 使用PaginatedDataTable应配合DataTableSource一起 新建一个Class继承DataTableSource这个抽象类，实现4个方法：|

     DataRow getRow(int index) { //根据索引获取内容行 }
     bool get isRowCountApproximate => false;
     int get rowCount => _shops.length;//数据总条数
     int get selectedRowCount => _selectCount;//选中的行数

 """;


