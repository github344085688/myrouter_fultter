import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;


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
              children: <Widget>[
                MaterialButton(
                  onPressed: () => _scan(),
                  child: Text("Scan${barcode}" ),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ],
            ),
          )),
    );
  }

  ///扫描二维码
  Future _scan() async {
    try {
      String barcode = await scanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == scanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
