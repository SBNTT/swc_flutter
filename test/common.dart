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

  @override
  init(BuildContext context) {}

  onAddButtonClick(BuildContext context) {
    dispatch<CounterState>(context, (state) => state.increment());
  }
  
}

class EmptyController extends SwcController {
  
  @override
  init(BuildContext context) { }
  
}