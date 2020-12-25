import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'explain.dart';
class WidgetsTextFormFieldEx extends StatefulWidget{
   const WidgetsTextFormFieldEx ({Key key}):super(key:key);

   @override
   _WidgetsTextFormFieldEx createState()=> _WidgetsTextFormFieldEx();
}
class _WidgetsTextFormFieldEx extends State<WidgetsTextFormFieldEx>{
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();
  bool _isValidateName = true;
  bool pwdShow = false; //密码是否显示明文
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child:Form(
            key:_formKey,//设置globalKey，用于后面获取FormState
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                    autofocus: true,
                    // autovalidate:true,
                    controller:_unameController,

                    decoration:InputDecoration(
                        icon: Icon(Icons.person),
                        labelText:"用户名",
                        hintText: "用户名",
                        hintStyle:TextStyle(color:Colors.blue),
                    ),
                    validator: (value) {
                      RegExp reg = new RegExp(r'^\d{11}$');
                      if (!reg.hasMatch(value)) {
                        return '请输入11位手机号码';
                      }
                      return null;
                     /* print('vvvvvvvvvvvvvv-$vaule');
                      return vaule
                          .trim()
                          .length > 0 ? null : "用户名不能为空";*/
                    },
                   /* inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
                      BlacklistingTextInputFormatter(RegExp("[abFeG]")),
                    ]*/

                ),
                TextFormField(
                  // autovalidate: true,
                  //   enabled: this._password != null && this._password.isNotEmpty,
                  obscureText: pwdShow,
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock),
                    // filled: true,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                      child: Icon(pwdShow ? Icons.visibility_off : Icons.visibility),
                    ),
                    /*  suffixIcon: IconButton(
                        icon: Icon(
                            pwdShow ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            pwdShow = !pwdShow;
                          });
                        },
                      ),*/
                  ),
                   /* onFieldSubmitted: (String value) {
                      setState(() {
                        this.pwdShow = value;
                      });
                    },*/
                    validator: (vaule) {
                      return vaule
                          .trim()
                          .length > 0 ? null : "您的登录密码";
                    }

                ),

                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录"),
                          color: Theme
                              .of(context)
                              .primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            //在这里不能通过此方式获取FormState，context不对
                            //print(Form.of(context));

                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if((_formKey.currentState as FormState).validate()){
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('提交成功...'),
                              ));//验证通过提交数据
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
        )
    );
  }
}
