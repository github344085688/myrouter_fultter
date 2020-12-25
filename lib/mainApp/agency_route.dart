import 'package:flutter/material.dart';
import 'package:widget_with_codeview/source_code_view.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:my_router_flutter/dart/class/super.dart';

class AgencyRoute extends StatefulWidget {
  final String sourceFilePath;
  final Widget child;
  final String _title;
  final String description;
  final Map<String, String> links;
  final String _routeName;
  final String _explain;
  final Widget icon;
  final dynamic arguments;

  // final Function namedConter;
  const AgencyRoute({Key key,
    this.sourceFilePath,
    @required this.child,
    String title,
    List children,
    this.description,
    this.links,
    String routeName,
    String explain,
    this.icon,
    this.arguments})
      :
        _title = title,
        _routeName = routeName,
        _explain = explain,
        super(key: key);

  AgencyRoute namedContr({Key key,
    String sourceFilePath,
    Widget child,
    String title,
    String description,
    Map<String, String> links,
    String routeName,
    String explain,
    Widget icon,
    dynamic arguments}) {
    return AgencyRoute(
      sourceFilePath: sourceFilePath ?? this.sourceFilePath,
      arguments: arguments ?? this.arguments,
      child: child ?? this.child,
      title: title ?? this.title,
      description: description ?? this.description,
      links: links ?? this.links,
      routeName: routeName ?? this.routeName,
      explain: explain ?? this._explain,
      icon: icon ?? this.icon,
    );
  }

  String get routeName =>
      this._routeName ?? '/${this.child.runtimeType.toString()}';

  String get title => _title ?? this.routeName;

  String get markdownDate =>
      this._explain != null ? this._explain : "No Explain";

  // Function get namedConter => this.child['namedConter'] != null ? this._explain : "No Explain";
  // String get routerArguments => this._arguments ?? this._arguments;

  @override
  _AgencyRoute createState() => _AgencyRoute();
}

class _AgencyRoute extends State<AgencyRoute> {
  final List<Widget> _pageList = List<Widget>();
  int _currentIndex = 0;

  @override
  void initState() {
    init();
    // print('////////////////${widget.arguments}');
    super.initState();
  }

  void init() {
    Widget child = this.widget.child;

    print(this.widget.child.runtimeType);
    // if(this.widget.child.namedConter !=null){
    //   Widget child = this.widget.child.namedCont(arguments:this.widget.arguments);
    // }
    print('agency_route-${child}.');
    // body: child.namedConter(arguments:widget.arguments),
    // child.namedCont(arguments:this.widget.arguments);
    _pageList..add(child)..add(SourceCodeView(
      filePath: this.widget.sourceFilePath,
    ))..add(Markdown(data: this.widget.markdownDate,
      styleSheet: MarkdownStyleSheet(
        // 支持修改样式
        blockquote: TextStyle(fontSize: 25.0),
        p: TextStyle(fontSize: 25.0),
        h1: TextStyle(fontSize: 30.0),
        a: TextStyle(fontSize: 25.0),
        code: TextStyle(fontSize: 20.0),
        em: TextStyle(fontSize: 25.0),
        strong: TextStyle(fontSize: 25.0),
        del: TextStyle(fontSize: 25.0),
        tableHead: TextStyle(fontSize: 25.0),
        tableBody: TextStyle(fontSize: 25.0),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
            builder: (BuildContext context) =>
            this.widget.routeName == Navigator.defaultRouteName
                ? this.widget.child
                : Scaffold(
                appBar: AppBar(
                  title: Text(this.widget._title),
                  elevation: 0,
                ),
                body: _pageList[_currentIndex],
                // body: DartSuper().namedConter(arguments:widget.arguments),
                bottomNavigationBar: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.phone_android,
                        ),
                        // ignore: deprecated_member_use
                        title: Text(
                          'Preview',
                        )),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.code,
                        ),
                        // ignore: deprecated_member_use
                        title: Text(
                          'Code',
                        )),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.book,
                        ),
                        // ignore: deprecated_member_use
                        title: Text(
                          'Explain',
                        )),
                  ],
                  currentIndex: _currentIndex,
                  onTap: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                resizeToAvoidBottomPadding: false, //输入框抵住键盘 内容不随键盘滚动
            )));
  }
}
