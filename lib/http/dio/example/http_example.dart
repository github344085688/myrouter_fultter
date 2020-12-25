import 'package:flutter/material.dart';
import '../http_utils.dart';

class HttpExample extends StatefulWidget {
  const HttpExample({Key key}) : super(key: key);

  @override
  _HttpExample createState() => _HttpExample();
//  createState
}

class _HttpExample extends State<HttpExample> {
  var data;
  var page;
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    var setData = await http.post("/getPageArrDic", {"page": 0});
    setState(() {
      data = setData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          width: double.infinity,
          child: Text("$data", style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
