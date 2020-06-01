import 'package:flutter/widgets.dart';
import 'package:swc_flutter/src/provider_helper.dart';
import 'package:swc_flutter/src/swc_widget.dart';

/// Base class for any Controller used with SWC library
/// 
/// Give access to [ProviderHelp.pGet<O>] and [ProviderHelper.dispatch<S>] methods
/// 
/// [SwcController.init] will be automaticaly called 
/// before `build` method. Called only one time.
abstract class SwcController<W extends SwcWidget> with ProviderHelper {

  W widget;

  init(BuildContext context);
  
}