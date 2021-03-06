import 'package:flutter/material.dart';
import './home_page_drawer.dart';
import './bottom_navigation_view.dart';
import './home_search_page.dart';
import './home_body.dart';
import './home_person.dart';
import 'package:my_router_flutter/mainApp/homePage/popup_menu_button/popup_menu_button_view.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final List<String> kEnglishWords=['MyHomePage','State','String'];
  MySearchDelegate _delegate;

  SelectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    _delegate = MySearchDelegate();
  }

  int currentIndex = 0;
  final skeletonPages = [HomeBody(), HomeBody(), HomeBody(), HomeBody()];

  _currentIndex(editText) {
    setState(() {
      currentIndex = editText;
      if (currentIndex == 3) {
        currentIndex = 0;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePerson()),
            (route) => true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _homeffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _homeffoldKey,
      appBar: AppBar(
        title: new Text('首页'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xffd55858),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.settings),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        // backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          // 非隐藏的菜单
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final String selected = await showSearch<String>(
                context: context,
                delegate: _delegate,
              );
              if (selected != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You have selected the aaa: $selected'),
                  ),
                );
              }
            },
          ),
          HomePopupMenuButton()
        ],
      ),
      drawer: HomePageDrawer(),
      body: HomeBody(),
      /*body: (currentIndex != 3)
          ? skeletonPages[currentIndex]
          : Builder(builder: (BuildContext context) => HomePerson()),*/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          backgroundColor: Color(0xffd55858),
          onPressed: () => Scaffold.of(context).openDrawer(),
          child: Icon(Icons.add_location_alt_outlined),
          elevation: 3.0,
        ),
      ),
      bottomNavigationBar: BottomNavigationView(
          currentIndex: currentIndex,
          setActivity: (currentIndex) => _currentIndex(currentIndex)),
      extendBody: true,
    );
  }
}
