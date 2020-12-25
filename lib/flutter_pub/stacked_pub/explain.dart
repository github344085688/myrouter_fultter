
const String STACKEDPUBMOUDELS = '''
## MVVMK框架
### 1.建立一个抽象类作为Model数据类
   * ### __变量variable__
   * ### __function__
   * ### __extends ChangeNotifier__
   > 共享Moudel => data, function
```
 abstract class TaskStepVM extends ChangeNotifier{
    closeTask();
    updateTitle();
 }

class PickTaskStepVM extends TaskStepVM{
  final BuildContext context;
  String title = 'default1'; 
  int counter = 0;
  PickTaskStepVM(this.context);

  void initSteps() {
    title = 'initialised';
    notifyListeners();
  }
  @override
  closeTask() async {
    counter++;
    title = '&counter';
    notifyListeners();
  }

}
```
### 2.建立一个抽象类作为ViewModel数据类
   * ### __extends StatelessWidget__
   * ### __ViewModelBuilder<PickTaskStepVM>.nonReactive()__ 
   * ### __viewModelBuilder: () => PickTaskStepVM(context)__
   * ### __onModelReady: (model) => model.initSteps()__
   * ### __ builder: (BuildContext context, PickTaskStepVM model, Widget child) => ModelView<PickTaskStepVM>(children: <Widget>[TitleSection(), DescriptionSection()])
    )__
   > ViewModel 驱动View 传入MOUDLE数据类型
```
class StackedNonReactive extends StatelessWidget {
  const StackedNonReactive({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) => ViewModelBuilder<PickTaskStepVM>.nonReactive(
      viewModelBuilder: () => PickTaskStepVM(context),
      onModelReady: (model) => model.initSteps(),
      builder: (BuildContext context, PickTaskStepVM model, Widget child) => ModelView<PickTaskStepVM>(children: <Widget>[TitleSection(), DescriptionSection()])
    );
}
```
### 3.建立一个View
   * ### __TaskStepVM__ MOUDLE数据类型__
   * ### __Widget build(BuildContext context, T model)  model => TaskStepVM__
   * ### __model.updateTitle()  model => PickTaskStepVM => updateTitle() __
   > TaskStepVM抽象类
   ```
class ModelView<T extends TaskStepVM> extends ViewModelWidget<T> {
  final List<Widget> children;
  const ModelView({Key key, this.children}) :
        super(key: key);
  @override
  Widget build(BuildContext context, T model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.updateTitle();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );

  }
}
   ```
   ```
   class FavoritesView extends StatelessWidget {
  const FavoritesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoritesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.incrementCounter(),
          ),
          body: Center(
              child: Text(
            model.counter.toString(),
            style: TextStyle(fontSize: 30),
          ))),
      viewModelBuilder: () => locator<FavoritesViewModel>(),
      onModelReady: (model) => model.setCounterTo999(),
      disposeViewModel: false,
      // Tell the ViewModelBuilder to only fire this once
      fireOnModelReadyOnce: true,
    );
  }
}
```
''';
