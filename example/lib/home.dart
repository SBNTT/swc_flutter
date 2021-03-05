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
