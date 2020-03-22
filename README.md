# State Widget Controller

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
class MyHomePage extends SwcStatefulWidget {

  SwcState createState() => _MyHomePageState();

}

class _MyHomePageState extends SwcState<MyHomePage, MyHomePageController> {

  final  _countState = CountState();

  getProviders() => [
    ChangeNotifierProvider<CountState>.value(value: _countState),
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
class MyHomePageController extends EasyController {

  init(BuildContext context) {
    print("init my home page");
  }

  onAddButtonClick(BuildContext context) {
    dispatch(context, (CountState state) => state.increment());
  }
 
}
```

