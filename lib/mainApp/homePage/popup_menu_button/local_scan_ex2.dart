import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:qr_flutter/qr_flutter.dart';



class LocalScan extends StatefulWidget {
  LocalScan({Key key}) : super(key: key);

  _LocalScan createState() => _LocalScan();
}

class _LocalScan extends State<LocalScan> {
  String barcode = null;
  Uint8List bytes = Uint8List(0);
  @override
  initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('二维码生成器'),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  // child: Image.memory(bytes),
                ),
//              _createBody(),
                Text(barcode ?? "请扫描相关的条形码"),
                MaterialButton(
                  onPressed: () => _scan(),
                  child: Text("Scan"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
                MaterialButton(
                  onPressed: () => _generateBarCode(barcode),
                  child: Text("生成普通二维码"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
                MaterialButton(
                  onPressed: () => _generateBarCode1(barcode),
                  child: Text("生成条形码"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ],
            ),
          )
      ),
    );
  }

  ///扫描二维码
  Future _scan() async {
    String cameraScanResult = await scanner.scan();
   /* try {
      String barcode = await scanner.scan();
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!这是扫描出来的结果"+ barcode +"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!这是扫描出来的结果");
      setState(() {
        this.barcode = barcode;
        bytes=Uint8List(0);
//        ClipboardData data = new ClipboardData(text:barcode);
//        Clipboard.setData(data);
      });
    } on Exception catch (e) {
      if (e == scanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    }

    on FormatException {
      setState(() => this.barcode =
      'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }*/
  }


  Future _generateBarCode(String inputCode) async {
    Uint8List result = await scanner.generateBarCode(inputCode);
    this.setState(() => this.bytes = result);
  }

  Future _generateBarCode1(String inputCode) async {
    Uint8List result = await scanner.generateBarCode(inputCode);
    this.setState(() => this.bytes = result);
  }
}
/*
//app主页
class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

//app主页状态,数字增加通过原生代码实现
class HomePageState extends State<HomePage> {
  //计数器
  int _counter = 0;

  //定义通道，作为通信标识符
  static const platform = const MethodChannel("add");

  //调用原生方法实现计数器自增
  Future<Null> incrementCount() async {
    int result = 0;
    try {
      //参数为方法名称
      result = await platform.invokeMethod("getNumber");
    } on PlatformException catch (e) {
      print(e.message);
    }

    //获取结果后改变界面状态,更新界面
    setState(() {
      _counter = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('与原生进行交互'),
          ),
          body: Center(
            child: Column(
              //主轴居中对齐
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('点击按钮次数:'),
                Text(
                  '$_counter',
                  style: TextStyle(fontSize: 20.0, color: Colors.lightBlue),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: incrementCount,
            tooltip: '增加数字',
            child: Icon(Icons.add),
          ),
        ));
  }
}*/
