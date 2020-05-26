import 'package:swc_flutter/swc_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountState with ChangeNotifier {

  int _value = 0;

  increment() {
    _value++;
    notifyListeners();
  }

  int get() => _value;

}

class MyHomePage extends SwcStatelessWidget<MyHomePageController> {

  getProviders() => [
    ChangeNotifierProvider<CountState>(create: (_) => CountState()),
  ];

  getController() => MyHomePageController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("swc_flutter example app"),
      ),
      body: Center(
        child: Consumer<CountState>(builder: (context, state, _) {
          return Text(state.get().toString());
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => controller.onAddButtonClick(context),
      ),
    );
  }

}

class MyHomePageController extends SwcController<MyHomePage> {

  init(BuildContext context) {
    print("init my home page");
  }

  onAddButtonClick(BuildContext context) {
    dispatch(context, (CountState state) => state.increment());
  }
  
}
