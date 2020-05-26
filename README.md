# State Widget Controller

![CI](https://github.com/SBNTT/swc_flutter/workflows/CI/badge.svg)
[![pub package](https://img.shields.io/pub/v/swc_flutter.svg)](https://pub.dev/packages/swc_flutter)
[![codecov](https://codecov.io/gh/SBNTT/swc_flutter/branch/master/graph/badge.svg)](https://codecov.io/gh/SBNTT/swc_flutter)


```dart
class CountState with ChangeNotifier {

  int _value = 0;

  increment() {
    _value++;
    notifyListeners();
  }

  int get() => _value;

}
```

```dart
class MyHomePage extends SwcStatelessWidget<MyHomePageController> {

  getProviders() => [
    ChangeNotifierProvider<CountState>(create: (_) => CountState()),
  ];

  getController() => MyHomePageController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("counting using swc_flutter"),
      ),
      body: Center(
        child: Consumer<CountState>(builder: (context, state, _) {
          return Text(state.get().toString());
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle),
        onPressed: () => controller.onAddButtonClick(context),
      ),
    );
  }

}
```

```dart
class MyHomePageController extends SwcController {

  init(BuildContext context) {
    print("init my home page");
  }

  onAddButtonClick(BuildContext context) {
    dispatch(context, (CountState state) => state.increment());
  }
 
}
```

