import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

mixin ProviderHelper {

  bool disposed = false;

  dispatch<S extends ChangeNotifier>(BuildContext context, Function(S state) fn) {
    if (disposed) return;

    try {
      fn(Provider.of<S>(context, listen: false));
    } catch (e) {}
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
