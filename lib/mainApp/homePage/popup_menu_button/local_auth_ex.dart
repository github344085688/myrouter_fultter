import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:transparent_image/transparent_image.dart'
    show kTransparentImage;

class LocalAuthExample extends StatefulWidget {
  const LocalAuthExample({Key key}) : super(key: key);

  @override
  _LocalAuthExampleState createState() => _LocalAuthExampleState();
}

class _LocalAuthExampleState extends State<LocalAuthExample> {
  bool _authSuccess = false;
  LocalAuthentication _localAuth;

  @override
  void initState() {
    super.initState();
    this._localAuth = LocalAuthentication();
  }

  Future<bool> _auth() async {
    setState(() => this._authSuccess = false);
    if (await this._localAuth.canCheckBiometrics == false) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Your device is NOT capable of checking biometrics.\n'
              'This demo will not work on your device!\n'
              'You must have android 6.0+ and have fingerprint sensor.'),
        ),
      );
      return false;
    }
    // **NOTE**: for local auth to work, tha MainActivity needs to extend from
    // FlutterFragmentActivity, cf. https://stackoverflow.com/a/56605771.
    try {
      final authSuccess = await this
          ._localAuth
          .authenticateWithBiometrics(localizedReason: '身份验证以查看隐藏图像');
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('authSuccess=$authSuccess')),
      );
      return authSuccess;
    } catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("指纹识别认证演示"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.fingerprint),
            label: Text('身份验证以查看隐藏图像'),
            onPressed: () async {
              final authSuccess = await this._auth();
              setState(() => this._authSuccess = authSuccess);
            },
          ),
          this._authSuccess
              ? FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: AssetImage('assets/images/animated_flutter_lgtm.gif'),
                )
              : Placeholder(),
        ],
      ));
}

/*
MainActiviti

import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterFragmentActivity {
  @Override
  public void configureFlutterEngine(FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
  }
}*/

// 在AndroidManifest.xml中增加USE_FINGERPRINT权限：

/*<manifest xmlns:android="http://schemas.android.com/apk/res/android"
package="com.mlkui.flutter.example">
<!-- Flutter needs it to communicate with the running application
to allow setting breakpoints, to provide hot reload, etc.
-->
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.USE_FINGERPRINT"/>
</manifest>*/

/*

package com.example.my_router_flutter

import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.plugins.GeneratedPluginRegistrant
class MainActivity: FlutterFragmentActivity() {
  override fun configureFlutterEngine( flutterEngine:
  FlutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine)
  }
}*/
