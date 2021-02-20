import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_router_flutter/mainApp/login/login_view_model.dart';

class HomePerson extends StatefulWidget {
  const HomePerson({Key key}) : super(key: key);

  @override
  _HomePerson createState() => _HomePerson();
}

class _HomePerson extends State<HomePerson> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
        viewModelBuilder: () => LoginViewModel(context),
        onModelReady: (model) => model.initSteps(),
        builder: (context, viewModel, _) => Scaffold(
            backgroundColor: Colors.white, //把scaffold的背景色改成透明
            appBar: PreferredSize(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new ExactAssetImage(
                      'assets/images/34.png',
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Stack(
                  overflow: Overflow.clip,
                  children: <Widget>[
                    Positioned(
                      left: 15.0,
                      top: 35.0,
                      width: 250.0,
                      height: 80.0,
                      child: ListTile(
                          contentPadding: EdgeInsets.all(00.0),
                          leading: Listener(
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 45.0,
                                child: Image.asset(
                                  'assets/images/47.jpg',
                                  width: 45.0,
                                  height: 45.0,
                                )),
                            // onPointerDown: (event) => print("down0"),
                            onPointerDown: (PointerDownEvent event)=>Navigator.pop(context),
                            onPointerMove: (PointerMoveEvent event){
                              print("onPointerMove:${event.position.toString()}");
                            },
                            onPointerUp: (PointerUpEvent event){
                              print("onPointerUp:${event.position.toString()}");
                            },

                            onPointerCancel: (PointerCancelEvent event){
                              print("onPointerCancel:${event.position.toString()}");
                            },
                            // Navigator.of(context).pop();
                            //_nextPage(-1);
                            // Navigator.pop(context); // 关闭当前页面
                          ),
                          title: Text('images',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              )),
                          subtitle: Text('images - assets',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ))),
                    )
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(120.0),
            ),
            body: Center(
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    color: Color(0xfff30000),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 45.0,
                    right: 45.0,
                    child: Container(
                      padding: EdgeInsets.only(top: 150.0),
                      decoration: BoxDecoration(
                        color: Color(0xff123748),
                      ),
                    ),
                  ),
                  _LoginFrom()
                ],
              ),
            )));
  }
}

class _LoginFrom extends ViewModelWidget<LoginViewModel> {

  TextEditingController _pwdController = new TextEditingController();

  // GlobalKey _formKey = new GlobalKey<FormState>();
  bool _isValidateName = true;
  bool pwdShow = false; //密码是否显示明文
  @override
  Widget build(BuildContext context, LoginViewModel _viewModel) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 40.0,
      right: 40.0,
      child: Container(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Form(
          // key: _formKey, //设置globalKey，用于后面获取FormState
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                  autofocus: true,
                  autovalidate: true,
                  controller: new TextEditingController(text: _viewModel.userName),
                  onChanged: (text) => _viewModel.setUserName(text),
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Colors.white),
                    labelText: "用户名",
                    hintText: "用户名",
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white30),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2, //宽度为5//边线颜色为黄色
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green, //边框颜色为绿色
                          width: 2, //宽度为5
                        )),
                  ),
                  validator: (vaule) {
                    return vaule.trim().length > 4 ? null : "您的登录密码";
                  }
                /*      validator: (value) {
                  RegExp reg = new RegExp(r'^\d{11}$');
                  if (!reg.hasMatch(value)) {
                    return '请输入11位手机号码';
                  }
                  return null;
                }*/
              ),

              TextFormField(
                  obscureText: pwdShow,
                  // controller: _pwdController,
                  onChanged: (text) => _viewModel.setPassword(text),
                  controller: new TextEditingController(text: _viewModel.password),
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white30),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple, //边框颜色为绿色
                          width: 2, //宽度为5
                        )),
                    icon: Icon(Icons.lock, color: Colors.white),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2, //宽度为5//边线颜色为黄色
                      ),
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.purple,
                            width: 4.0,
                            style: BorderStyle.solid)),
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white, width: 2)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color:  Colors.purple, width: 2)),
                    suffixIcon: GestureDetector(
                      // onTap: () {
                      //   // setState(() {
                      //   //   pwdShow = !pwdShow;
                      //   // });
                      // },
                      child: Icon(
                          pwdShow
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white30),
                    ),
                  ),
                  validator: (vaule) {
                    return vaule.trim().length > 0 ? null : "您的登录密码";
                  }),

              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          color: Colors.red[700],
                          child: Text("登录"),
                          // color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed:()=> _viewModel.login(context)
                        /* onPressed: () {
                          if ((_formKey.currentState as FormState)
                              .validate()) {

                            Scaffold.of(context)
                                .showSnackBar(SnackBar(
                              content: Text('提交成功...'),
                            ));//验证通过提交数据
                          }
                        },*/
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          color: Colors.red[400],
                          child: Text("找回密码"),
                          // color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed:()=> _viewModel.retrieve()
                        /* onPressed: () {
                          if ((_formKey.currentState as FormState)
                              .validate()) {

                            Scaffold.of(context)
                                .showSnackBar(SnackBar(
                              content: Text('提交成功...'),
                            ));//验证通过提交数据
                          }
                        },*/
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
