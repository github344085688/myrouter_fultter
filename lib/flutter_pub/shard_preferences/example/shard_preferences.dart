import 'package:flutter/material.dart';
import 'package:my_router_flutter/flutter_pub/shard_preferences/data_base/shared_preference.dart';
 class Preferences extends StatefulWidget{
   const Preferences({Key key}):super(key:key);
   @override
   _Preferences createState()=>_Preferences();
 }
 class _Preferences extends State<Preferences>{
  var token;
  @override
  void initState() {
    this.setToken();
    this.getToken();
    super.initState();
  }

  void setToken() async{
//    token= await  SharedPreference.set('token','25556');
    print(token);
  }

 void getToken() async{
  var result  = await  SharedPreference.get('token');
  setState(() {
    token = result;
  });
   print(token);
 }

  @override
   Widget build(BuildContext context){
    return Scaffold(
      body:SafeArea(
        child: Container(
          width: double.infinity,
          child: Text("$token", style: TextStyle(color: Colors.black)),
        ),
      )
    );
  }
}