import 'package:swc_flutter/src/swc_controller.dart';
import 'package:swc_flutter/src/swc_widget_state.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class SwcStatefulWidget extends StatefulWidget {

  @override
  SwcState createState();

  @override
  StatefulElement createElement() =>_SwcStatefulElement(this);

}

abstract class SwcState<W extends SwcStatefulWidget, C extends SwcController> extends State<W> {

  final _state = SwcWidgetState<C>();

  List<SingleChildWidget> getProviders() => [];

  C getController();

  C get controller => _state.controller;

  @protected
  Widget _wrapper(BuildContext context) {
    setState(() {
      
    });
    return MultiProvider(
      providers: getProviders(),
      child: Builder(builder: (context) {
        if (!_state.initialized) {
          _state.initialized = true;
          _state.controller = getController();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.init(context);
          });
        }

        return build(context);
      }),
    );
  }

  @override
  void dispose() {
    controller.disposed = true;
    super.dispose();
  }

}

class _SwcStatefulElement extends StatefulElement {

  _SwcStatefulElement(SwcStatefulWidget widget) : super(widget);

  @override
  SwcState get state => super.state;

  @override
  Widget build() => state._wrapper(this);

}