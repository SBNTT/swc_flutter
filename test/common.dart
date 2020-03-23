import 'package:flutter/widgets.dart';
import 'package:swc_flutter/src/swc_controller.dart';

class CounterState with ChangeNotifier {

  int _value = 0;

  increment() {
    _value++;
    notifyListeners();
  }

  int get() => _value;

}

class CounterController extends SwcController {

  init(BuildContext context) {}

  onAddButtonClick(BuildContext context) {
    dispatch(context, (CounterState state) => state.increment());
  }
  
}