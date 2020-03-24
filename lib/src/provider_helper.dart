import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class _ProviderHelperState {

  bool disposed = false;

}

mixin ProviderHelper {

  final _state = _ProviderHelperState();

  dispatch<S extends ChangeNotifier>(BuildContext context, Function(S state) fn) {
    final state = pGet<S>(context);
    if (state == null) return;
    fn(state);
  }

  O pGet<O>(BuildContext context) {
    if (_state.disposed) return null;

    try {
      return Provider.of<O>(context, listen: false);
    } catch (e) {
      return null;
    }
  }

  setDisposed(bool value) => _state.disposed = value;

}
