import 'package:swc_flutter/src/swc_controller.dart';
import 'package:swc_flutter/src/swc_widget_state.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:swc_flutter/swc_flutter.dart';

abstract class SwcStatelessWidget
    <C extends SwcController>
    extends StatelessWidget {

  SwcStatelessWidget({Key key}) : super(key: key);

  final _state = SwcWidgetState<C>();

  List<SingleChildWidget> getProviders() => [];

  C getController();

  C get controller => _state.controller;

  /// Create a custom [StatelessElement] which will call our `SwcStatelessWidget._wrapper`
  ///  instead of [SwcStatelessWidget.build] by default
  @override
  StatelessElement createElement() => _SwcStatelessElement(this);

  @protected
  Widget _wrapper(BuildContext context) {
    final providers = getProviders();

    if (providers.isEmpty) {
      return _providerChild(context);
    }

    return MultiProvider(
      providers: providers,
      child: Builder(builder: _providerChild),
    );
  }

  Widget _providerChild(BuildContext context) {
    if (!_state.initialized) {
      _state.initialized = true;
      _state.controller = getController();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _state.controller?.init(context);
      });
    }

    return build(context);
  }

}

class _SwcStatelessElement extends StatelessElement {

  _SwcStatelessElement(SwcStatelessWidget widget) : super(widget);

  @override
  SwcStatelessWidget get widget => super.widget;

  @override
  Widget build() => widget._wrapper(this);
  
}
