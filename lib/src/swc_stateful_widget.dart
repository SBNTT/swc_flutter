import 'package:swc_flutter/src/swc_controller.dart';
import 'package:swc_flutter/src/swc_widget.dart';
import 'package:swc_flutter/src/swc_widget_state.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class SwcStatefulWidget 
    extends StatefulWidget
    implements SwcWidget {

  const SwcStatefulWidget({Key? key}) : super(key: key);

  /// Create a custom [StatelessElement] which will call our `SwcStatelessWidget._wrapper`
  @override
  StatefulElement createElement() => _SwcStatefulElement(this);

}

abstract class SwcState
    <W extends SwcStatefulWidget, C extends SwcController<SwcWidget>>
    extends State<W> {

  final _state = SwcWidgetState<C>();
  
  List<SingleChildWidget> getProviders();

  C getController();

  C get controller => _state.controller;

  @protected
  Widget _wrapper(BuildContext context) {
    _state.controller = getController();
    _state.controller.widget = widget;
    _state.providers = getProviders();

    if (_state.providers.isEmpty) {
      return _providerChild(context);
    }

    return MultiProvider(
      providers: _state.providers,
      child: Builder(builder: _providerChild),
    );
  }

  Widget _providerChild(BuildContext context) {
    if (!_state.initialized) {
      _state.initialized = true;
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        controller.init(context);
      });
    }

    controller.setDisposed(value: false);

    return build(context);
  }

  @override
  void dispose() {
    controller.setDisposed(value: true);
    super.dispose();
  }

}

class _SwcStatefulElement extends StatefulElement {

  _SwcStatefulElement(SwcStatefulWidget widget) : super(widget);

  @override
  SwcState get state => super.state as SwcState<SwcStatefulWidget, SwcController<SwcWidget>>;

  @override
  Widget build() => state._wrapper(this);

}
