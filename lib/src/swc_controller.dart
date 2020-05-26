import 'package:swc_flutter/src/provider_helper.dart';
import 'package:flutter/widgets.dart';

/// Base class for any Controller used with SWC library
/// 
/// Give access to [ProviderHelp.pGet<O>] and [ProviderHelper.dispatch<S>] methods
/// 
/// [SwcController.init] will be automaticaly called 
/// before `build` method. Called only one time.
abstract class SwcController<W extends Widget> with ProviderHelper {

  W widget;

  init(BuildContext context);
  
}