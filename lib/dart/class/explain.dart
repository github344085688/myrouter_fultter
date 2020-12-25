
const String DARTSUPER = """
```
return Scaffold(
  appBar: AppBar(
    title: new Text("首页"),
  ),
  resizeToAvoidBottomPadding: false, //输入框抵住键盘 内容不随键盘滚动
);
```
resizeToAvoidBottomPadding: false, //输入框抵住键盘
## __Dart构造函数：__
  - ClassName(...) //普通构造函数
  - Classname.identifier(...) //命名构造函数
  - const ClassName(...) //常量构造函数
  - factroy ClassName(...) //工厂构造函数

## __1 普通构造函数__
```
const ClassName({Key key, String explain, dynamic arguments})
      : assert(explain != null),
        assert(arguments != {}),
        _explain = explain,
        arguments = arguments ,
        super(key: key);
``` 
## 1.1 __super__  对父类进行传参
> super(key: key);
## 1.2 __this.variable__  (构造函数对变量直接赋值) 
## 1.3 __:__  variable初始化 
> ():xxx=xxx,super(key: key);
## assert assert来中断正常的执行.

example:
```
class Person {
  var name;
  var age;
  var gg = 'ggggggggg';
  Person(this.name, this.age) {
    print("{this.name},{this.age}");
  }
  getInfo() {
    print("Person Person--{this.name},Person--{this.age}");
  }
}

class Child extends Person {
  var sex='sss';
  Child(name, age, sex) :sex = sex, super(name, age); // 构造函数，并赋值
  run() {
    super.getInfo(); //子类调用父类的方法    
  }
  
  @override
  getInfo() {
  }
}

main() {
  var w = new Child("张三", '20', '男');
  w.getInfo();
  w.run();
}
```
__如果想知道某个变量属于哪个类，可以使用runtimeType: 
print('The type of a is {a.runtimeType}');__

------

> Child(name,age, sex):super(name,age){
>>   this.sex = sex;
>>   this.getInfo(); //d调用自己 getInfo(Child.getInfo)
> }
    // 覆写父类的方法,
  @override //建议写上



## __2 命名构造函数__
""";