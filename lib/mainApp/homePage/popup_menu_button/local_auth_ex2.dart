import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:transparent_image/transparent_image.dart'
    show kTransparentImage;

class LocalAuthExamples extends StatefulWidget {
  const LocalAuthExamples({Key key}) : super(key: key);

  @override
  _LocalAuthExampleState createState() => _LocalAuthExampleState();
}

class _LocalAuthExampleState extends State<LocalAuthExamples> {
   //下面是汉化


  @override
  Widget build(BuildContext context) {
    var localAuth = LocalAuthentication();

    return Scaffold(
        appBar: AppBar(
          title: Text("指纹识别认证演示"),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async{
                  //下面是汉化
                  const andStrings = const AndroidAuthMessages(
                    cancelButton: '取消',
                    goToSettingsButton: '去设置',
                    fingerprintNotRecognized: '指纹识别失败',
                    goToSettingsDescription: '请设置指纹.',
                    fingerprintHint: '指纹',
                    fingerprintSuccess: '指纹识别成功',
                    signInTitle: '指纹验证',
                    fingerprintRequiredTitle: '请先录入指纹!',
                  );

                  try {
                    bool didAuthenticate =
                    await localAuth.authenticateWithBiometrics(
                        localizedReason:
                        '扫描指纹进行身份识别',
                        useErrorDialogs: false,
                        stickyAuth: true,
                        androidAuthStrings: andStrings
                    );
                    // print(didAuthenticate);
                  } catch (e) {
                    print(e);
                  }

                },
                child: Text("指纹生物识别"),
              )
            ],
          ),
        )

    );
  }
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
