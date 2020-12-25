import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_router_flutter/flutter_pub/provider/counter.dart';
class ProviderExample extends StatefulWidget{
  const ProviderExample({Key key}):super(key:key);
  @override
  _ProviderExample createState()=> _ProviderExample();

}
class _ProviderExample extends State<ProviderExample>{
 /* onPressed: () {
  Provider.of<Counter>(context, listen: false).add();
  controller.animateTo(0,
  duration: Duration(seconds: 1), curve: Curves.easeOut);
  }*/

  @override
  Widget build(BuildContext context){
   final providerCounter =  Provider.of<Counter>(context, listen: false).count;
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
            width: double.infinity,
            child: Scrollbar(
              child: Text(providerCounter.toString())
            )
        ),
      ),
    );
  }

}
