import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/routers/page_router_config.dart';
class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);

  _HomeBody createState() => _HomeBody();
}

class _HomeBody extends State<HomeBody> {
  Widget _BuildRow(AgencyRoute root) {
    // print("++++=====${root.routeName}");
    // print("................=${root.markdownDate}");
    // print("................=${root.sourceFilePath.split('/')}");
    var  filePath = root.sourceFilePath.split('/');
    var filePathNmae = filePath[filePath.length-1];
    return ListTile(
      leading: Icon(Icons.face_sharp),
      title: Text(root.title),
      trailing: root.icon == null ? null : root.icon,
      subtitle: root.description == null ? Text(filePathNmae) : Text(root.description +' :=>'+ filePathNmae),
      onTap: () => Navigator.of(context).pushNamed(root.routeName,arguments: {
        "id":123
      }),
      // onTap: () => Navigator.of(context).pushNamed(root.routeName)

    );
  }

  Widget _EntryItem(DefaultRoute root) {
    if (root.children  == null && root.routes == null) return ListTile(title: Text(root.groupName));
    var _isChanged;
    return ExpansionTile(
        key: PageStorageKey<DefaultRoute>(root),
        backgroundColor: Color(0x20388E3C),//展开时的背景颜色
        onExpansionChanged:(bool){
          _isChanged = bool;
        },
        leading: (root.children == null)
            ? ((root.children  != null)
            ? Icon(Icons.arrow_drop_down)
            : Icon(Icons.arrow_drop_up))
            : ((root.children  != null)
            ? Icon(Icons.notes_outlined)
            : Icon(Icons.arrow_drop_down)),
        title: Text(root.groupName),
        children: (root.routes != null)?
        root.routes.map(_BuildRow).toList() :
        root.children.map(_EntryItem).toList()
    );
  }
  @override
  Widget build(BuildContext context) =>ListView.builder(
    itemBuilder: (BuildContext context, int index) => _EntryItem(MyDefaultRoutes[index]),
    itemCount: MyDefaultRoutes.length,
  );
}
