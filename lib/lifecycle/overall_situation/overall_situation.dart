import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
// import 'explain.dart';

class OverallSituation extends StatefulWidget {
  const OverallSituation({Key key}) : super(key: key);

  @override
  _OverallSituation createState() => _OverallSituation();
}

class _OverallSituation extends State<OverallSituation> {
  @override
  Widget build(BuildContext context) => Scrollbar(
    child: SingleChildScrollView(
      padding: EdgeInsets.all(0.0),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/2-12.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 26.0,
          ),
          Image.asset(
            'assets/images/3-4.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          WidgetMarkdown(data: '''
## Flutter生命周期可以分为3个阶段：
   - 1、实例化组件并添加到树， 即Navigator.push；
   - 2、状态变化，即打开新的widget或者依赖的上级widget发生变化；
   - 3、从树中移除, 即Navigator.pop。 
         
### __构造函数__
> 同其它高级语言， 只执行一次；
### __initState__
> 插入到渲染树时调用，只执行一次。
### __didChangeDependencies__
>  1、在初始化initState后执行； 2、显示/关闭其它widget。 3、可执行多次；
### __didUpdateWidget__
> 上级节点rebuild widget时， 即上级组件状态发生变化时会触发子widget执行didUpdateWidget;
### __deative__
> 有点像Android的onStop函数， 在打开新的Widget或回到这个widget时会执行； 可执行多次；
### __dispose__
> 类似于Android的onDestroy， 在执行Navigator.pop后会调用该办法， 表示组件已销毁；
### __reassemble__
> 点击闪电会执行，只用于调试时的hot reload。 release版本不会执行该函数。
  
              
              '''),
        ],
      ),
    ),
  );
}
