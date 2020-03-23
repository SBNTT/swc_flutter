import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

mixin ProviderHelper {

  bool disposed = false;

  dispatch<S extends ChangeNotifier>(BuildContext context, Function(S state) fn) {
    final state = pGet<S>(context);
    if (state == null) return;
    fn(state);
  }

  O pGet<O>(BuildContext context) {
    if (disposed) return null;

    try {
      return Provider.of<O>(context, listen: false);
    } catch (e) {
      return null;
    }
  }

}
