import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class _ProviderHelperState {

  bool disposed = false;

}

/// Set of methods that helps using `Provider.of` safely
/// 
/// Supports getting an arbitrary value by type with [ProviderHelper.pGet<O>]
/// or dispatching a new state with [ProviderHelper.dispatch<S>]
mixin ProviderHelper {

  /// A simple object that carry a `disposed` flag
  /// 
  /// Each methods must check if the components using this instance 
  /// has been disposed. When the `disposed` flag is true, then:
  /// 
  /// * null should be returned if the method must returns something
  /// * nothing should be done in other cases
  final _state = _ProviderHelperState();

  /// Shorthand method to safely dispatch a new State
  /// 
  /// `S` must be a descendant of ChangeNotifier
  /// 
  /// if `disposed` flag is true or if no object of type `S`
  /// has been found, `fn` callback will not be called
  /// 
  /// ```dart
  /// dispatch(context, (FooState state) => state.bar());
  /// ```
  dispatch<S extends ChangeNotifier>(BuildContext context, Function(S state) fn) {
    final state = pGet<S>(context);
    if (state == null) return;
    fn(state);
  }

  /// Shorthand method to safely retrieve an arbitrary `O` provided object
  /// 
  /// returns null if `disposed` flag is true or if an exception is thrown
  /// 
  /// You must check for null value, or use the null aware operator (`?.` or `??`)
  /// 
  /// ```dart
  /// pGet<FooObject>(context)?.bar();
  /// ```
  O? pGet<O>(BuildContext context) {
    if (_state.disposed) return null;

    try {
      return Provider.of<O>(context, listen: false);
    } catch (e) {
      return null;
    }
  }

  setDisposed({required bool value}) => _state.disposed = value;

}
