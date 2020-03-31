import 'package:provider/single_child_widget.dart';
import 'package:swc_flutter/src/swc_controller.dart';

class SwcWidgetState<C extends SwcController> {

  bool initialized = false;
  C controller;
  List<SingleChildWidget> providers;
  
}
