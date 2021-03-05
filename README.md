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

  @override
  getProviders() => [
    ChangeNotifierProvider<CountState>(create: (_) => CountState()),
  ];

  @override
  getController() => MyHomePageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('swc_flutter example app'),
      ),
      body: Center(
        child: Consumer<CountState>(builder: (context, state, _) {
          return Text(state.get().toString());
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.onAddButtonClick(context),
        child: const Icon(Icons.add),
      ),
    );
  }

}
```

```dart
class MyHomePageController extends SwcController<MyHomePage> {

  @override
  init(BuildContext context) {
    // ignore: avoid_print
    print('init my home page');
  }

  onAddButtonClick(BuildContext context) {
    dispatch<CountState>(context, (state) => state.increment());
  }
  
}
```

