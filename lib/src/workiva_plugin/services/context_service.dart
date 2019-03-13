import 'package:extensions_playground/src/workiva_plugin/extension_points/context_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/services/context.dart';
import 'package:inject/inject.dart';

ContextService contextService;

abstract class ContextService {
  String get activeContextId;
  void activate(String contextId);
}

class ContextServiceImpl implements ContextService {
  ContextExtensionPoint _contextExtensionPoint;
  Context _activeContext;

  @provide
  ContextServiceImpl(this._contextExtensionPoint);

  @override
  String get activeContextId => _activeContext.identifier;

  @override
  void activate(String contextId) {
    var context = _contextExtensionPoint.extensionPoint.extensions.firstWhere(
        (extension) => extension.identifier == contextId,
        orElse: () => null);
    if (context != null) {
      _activeContext = context;
    } else {
      print('context \'$contextId\' not found');
    }
  }
}
