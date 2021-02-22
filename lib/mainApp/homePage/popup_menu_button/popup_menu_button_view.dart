import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/homePage/popup_menu_button/image_picker_ex.dart';
import 'package:my_router_flutter/mainApp/homePage/popup_menu_button/local_auth_ex.dart';
import 'package:my_router_flutter/mainApp/homePage/popup_menu_button/local_auth_ex2.dart';
import 'package:my_router_flutter/mainApp/homePage/popup_menu_button/local_notifications_ex.dart';
import 'package:my_router_flutter/mainApp/utilities/local_notifications_view_moudle.dart';
import 'package:my_router_flutter/mainApp/homePage/popup_menu_button/popup_menu_button_view_moule.dart';
import 'package:my_router_flutter/mainApp/homePage/popup_menu_button/local_scan_ex.dart';
class HomePopupMenuButton extends StatefulWidget {
  const HomePopupMenuButton({Key key}) : super(key: key);

  @override
  _HomePopupMenuButton createState() => _HomePopupMenuButton();
}

class _HomePopupMenuButton extends State<HomePopupMenuButton> {
  String _selectedValue;

  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
        tooltip: 'PopupMenuButton',
        //tooltip是长按时弹出的提示，
        // initialValue: '语文',//设置其初始值
        elevation: 5,
        //设置其阴影值
        padding: EdgeInsets.all(0),//内边距
        // color: Colors.red,//弹出菜单的背景颜色：
        icon: Icon(Icons.more_horiz_rounded),
        // child: Text('学科'),//PopupMenuButton显示3个小圆点，我们也可以对齐进行设置，
        shape: RoundedRectangleBorder(
            //设置弹出菜单边框：
            side: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5.0)),
        offset: Offset(1, 120),
        // padding:EdgeInsets.only(top:-5.0),
        itemBuilder: (context) => _getPopupMenu(context),
        onSelected: (String value) {
          print('onSelected');
          _selectValueChange(context,value);
        },
        onCanceled: () {
          print('onCanceled');
        },
//      child: RaisedButton(onPressed: (){},child: Text('选择'),),
      );

  _getPopupMenu(BuildContext context) {
    return <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        value: 'localAuth',
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(Icons.fingerprint,color:Colors.black38),
            ),
            Expanded(
              flex: 2,
              child: Text('验证'),
            ),
          ],
        ),
      ),
      PopupMenuDivider(),
      PopupMenuItem<String>(
        value: 'addFriend',
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(Icons.person_add_rounded,color:Colors.black38),
            ),
            Expanded(
              flex: 2,
              child: Text('添加朋友'),
            ),
          ],
        ),
      ),
      PopupMenuDivider(
        height: 3.0,
      ),
      PopupMenuItem<String>(
        value: 'photograph',
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(Icons.photo_camera_rounded,color:Colors.black38),
            ),
            Expanded(
              flex: 2,
              child: Text('拍照'),
            ),
          ],
        ),
      ),
      PopupMenuDivider(
        height: 3.0,
      ),
      PopupMenuItem<String>(
        value: 'helpAndFeedback',
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(Icons.ad_units,color:Colors.black38),
            ),
            Expanded(
              flex: 2,
              child: Text('推送'),
            ),
          ],
        ),
      ),
      PopupMenuItem<String>(
        value: 'notification',
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(Icons.ad_units,color:Colors.black38),
            ),
            Expanded(
              flex: 2,
              child: Text('推送'),
            ),
          ],
        ),
      ),
      PopupMenuDivider(
        height: 3.0,
      ),
      PopupMenuItem<String>(
        value: 'qrscan',
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(Icons.qr_code_scanner,color:Colors.black38),
            ),
            Expanded(
              flex: 2,
              child: Text('扫一扫'),
            ),
          ],
        ),
      ),
    ];
  }

  _selectValueChange(BuildContext context,String value) {
    switch(value){
      case 'localAuth':
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LocalAuthExample()),
                (route) => true);
        break;
      case 'addFriend':
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LocalAuthExamples()),
                (route) => true);
        break;
      case 'photograph':
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ImagePickerExample()),
                (route) => true);
        break;
      case 'helpAndFeedback':
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LocalNotifications()),
                (route) => true);
        break;
      case 'notification':
        LocalNotificationsViewMoudle(context).showNotification();
        break;
      case 'qrscan':
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LocalScan()),
                (route) => true);
        break;
      default:
        // executeUnknown();
    }

    // setState(() {
    //   _selectedValue = value;
    // });
  }
}
