import 'package:swc_flutter/swc_flutter.dart';
import 'package:example/settings.dart';
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

class MyHomePage extends SwcStatefulWidget {

  SwcState createState() => _MyHomePageState();

}

class _MyHomePageState extends SwcState<MyHomePage, MyHomePageController> {

  final _countState = CountState();

  getProviders() => [
    ChangeNotifierProvider<CountState>.value(value: _countState),
  ];

  getController() => MyHomePageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("swc_flutter example app"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => controller.onSettingsButtonClick(context),
          ),
        ],
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

class MyHomePageController extends SwcController {

  init(BuildContext context) {
    print("init my home page");
  }

  onAddButtonClick(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000), () {
      dispatch(context, (CountState state) => state.increment());
    });
  }

  onSettingsButtonClick(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }
  
}
