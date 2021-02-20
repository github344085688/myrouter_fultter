import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;
// import 'package:qr_flutter/qr_flutter.dart';



class LocalScan extends StatefulWidget {
  LocalScan({Key key}) : super(key: key);

  _LocalScan createState() => _LocalScan();
}

class _LocalScan extends State<LocalScan> {
  String barcode = null;
  Uint8List bytes = Uint8List(0);
  // @override
  // initState() {
  //   super.initState();
  // }

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
                  child: Text("Scan"),
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
    String photoScanResult = await scanner.scan();
  }
}
