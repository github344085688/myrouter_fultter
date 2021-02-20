import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/auth_strings.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final andStrings = const AndroidAuthMessages(
    cancelButton: '取消',
    goToSettingsButton: '去设置',
    fingerprintNotRecognized: '指纹识别失败',
    goToSettingsDescription: '请设置指纹.',
    fingerprintHint: '指纹',
    fingerprintSuccess: '指纹识别成功',
    signInTitle: '指纹验证',
    fingerprintRequiredTitle: '请先录入指纹!',
  );

  @override
  void initState() {
    super.initState();
    this._localAuth = LocalAuthentication();
  }

  Future<bool> _auth() async {
    setState(() => this._authSuccess = false);

    if (await this._localAuth.canCheckBiometrics == false) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('您的设备无法检查生物识别。'
              '这个演示将不能在您的设备上工作!\n'
              '你必须使用android 6.0以上系统，并配备指纹传感器。'),
        ),
      );
      return false;
    }

    try {
      final authSuccess = await this._localAuth.authenticateWithBiometrics(
          localizedReason: '扫描指纹进行身份识别',
          useErrorDialogs: false,
          stickyAuth: true,
          androidAuthStrings: andStrings);
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('authSuccess=$authSuccess')),
      );
      return authSuccess;
    } catch (e) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("指纹识别认证演示"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.fingerprint),
            label: Text('Auth in to view hidden image'),
            onPressed: () async {
              final authSuccess = await this._auth();
              setState(() => this._authSuccess = authSuccess);
            },
          ),
          this._authSuccess
              ? FadeInImage.assetNetwork(
                  image:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fa4.att.hudong.com%2F10%2F39%2F01300000111114121474393119380.jpg&refer=http%3A%2F%2Fa4.att.hudong.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1615368452&t=903ec3a4a44dcd62ee64eebb6d6b04ec',
                  placeholder: 'assets/images/124.gif' /* 指定gif */,
                )
              : Image.asset('assets/images/123.gif')
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
