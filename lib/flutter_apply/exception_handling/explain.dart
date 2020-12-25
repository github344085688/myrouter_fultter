
const String EXCEPTIONHANDLING = '''
## Dart单线程模型

##  Flutter异常捕获
>Dart中可以通过try/catch/finally来捕获代码块异常，这个和其它编程语言类似，如果读者不清楚，可以查看Dart语言文档，不再赘述，下面我们看看Flutter中的异常捕获。

### Flutter框架异常捕获
```
@override
void performRebuild() {
 ...
  try {
    //执行build方法  
    built = build();
  } catch (e, stack) {
    // 有异常时则弹出错误提示  
    built = ErrorWidget.builder(_debugReportException('building &this', e, stack));
  } 
  ...
}
```
> 可以看到，在发生异常时，Flutter默认的处理方式是弹一个ErrorWidget，但如果我们想自己捕获异常并上报到报警平台的话应该怎么做？我们进入_debugReportException()方法看看：

```
FlutterErrorDetails _debugReportException(
  String context,
  dynamic exception,
  StackTrace stack, {
  InformationCollector informationCollector
}) {
  //构建错误详情对象  
  final FlutterErrorDetails details = FlutterErrorDetails(
    exception: exception,
    stack: stack,
    library: 'widgets library',
    context: context,
    informationCollector: informationCollector,
  );
  //报告错误 
  FlutterError.reportError(details);
  return details;
}
```
''';
