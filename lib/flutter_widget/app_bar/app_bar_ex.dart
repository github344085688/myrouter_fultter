import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'documents.dart' show APPBAR_DOC;
import 'package:provider/provider.dart';
import 'package:my_router_flutter/flutter_pub/provider/counter.dart';

class AppBarExample extends StatefulWidget {
  const AppBarExample({Key key}) : super(key: key);

  @override
  _AppBarExample createState() => _AppBarExample();
}

class _AppBarExample extends State<AppBarExample> {
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: Icon(Icons.tag_faces),
        automaticallyImplyLeading: true,
        title: Text('AppBar-${Provider.of<Counter>(context).count}'),
        centerTitle: true,
        brightness: Brightness.dark,
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        toolbarOpacity: 1.0,
        bottomOpacity: 1.0,
        primary: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.directions_bike),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "搜索",
            onPressed: () {
              print("搜索");
            },
          ),
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map<PopupMenuItem<Choice>>((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: PopupMenuItemCard(
                    choice: Choice(title: choice.title, icon: choice.icon),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
            width: double.infinity,
            child: Scrollbar(
              child: Markdown(
                data: APPBAR_DOC,
              ),
            )),
      ),
    );
  }
  /**
      class Choice {
      const Choice({this.title, this.icon});

      final String title;
      final IconData icon;
      }

      const List<Choice> choices = <Choice>[
      Choice(title: '发起群聊', icon: Icons.chat),
      Choice(title: '添加朋友', icon: Icons.add_call),
      Choice(title: '扫一扫', icon: Icons.scanner),
      Choice(title: "收付款", icon: Icons.payment),
      ];

      class PopupMenuItemCard extends StatelessWidget {
      const PopupMenuItemCard({Key key, this.choice}) : super(key: key);

      final Choice choice;

      @override
      Widget build(BuildContext context) {
      // TODO: implement build
      final TextStyle textStyle = Theme.of(context).textTheme.headline;

      return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      Icon(choice.icon, size: 20.0, color: textStyle.color),
      Container(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(choice.title, style: TextStyle(fontSize: 18)),
      )
      ],
      );
      }
      }

      class ChoiceCard extends StatelessWidget {
      const ChoiceCard({Key key, this.choice}) : super(key: key);

      final Choice choice;

      @override
      Widget build(BuildContext context) {
      final TextStyle textStyle = Theme.of(context).textTheme.headline;
      return Card(
      color: Colors.white,
      child: Center(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Icon(
      choice.icon,
      size: 128.0,
      color: textStyle.color,
      ),
      Text(choice.title, style: textStyle),
      ],
      ),
      ),
      );
      }
      }
*/
      }

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: '发起群聊', icon: Icons.chat),
  Choice(title: '添加朋友', icon: Icons.add_call),
  Choice(title: '扫一扫', icon: Icons.scanner),
  Choice(title: "收付款", icon: Icons.payment),
];

class PopupMenuItemCard extends StatelessWidget {
  const PopupMenuItemCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextStyle textStyle = Theme.of(context).textTheme.headline;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(choice.icon, size: 20.0, color: textStyle.color),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(choice.title, style: TextStyle(fontSize: 18)),
        )
      ],
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 128.0,
              color: textStyle.color,
            ),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
