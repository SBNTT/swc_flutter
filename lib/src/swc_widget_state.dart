import 'package:provider/single_child_widget.dart';
import 'package:swc_flutter/src/swc_controller.dart';
import 'package:swc_flutter/src/swc_widget.dart';

class SwcWidgetState<C extends SwcController<SwcWidget>> {

  bool initialized = false;
  C controller;
  List<SingleChildWidget> providers;
  
}
