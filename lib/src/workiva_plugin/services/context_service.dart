import 'dart:async';

import 'package:extensions_playground/src/workiva_plugin/extension_points/context_extension_point.dart';
import 'package:extensions_playground/src/workiva_plugin/services/context.dart';
import 'package:inject/inject.dart';

ContextService contextService;

abstract class ContextService {
  String get activeContextId;
  Stream<Null> get didChange;
  void activate(String contextId);
}

class ContextServiceImpl implements ContextService {
  ContextExtensionPoint _contextExtensionPoint;
  ContextNode _activeContext;
  StreamController<Null> _didChangeController =
      new StreamController<Null>.broadcast();

  final ContextTree _contextTree;

  @provide
  ContextServiceImpl(this._contextExtensionPoint) : _contextTree = new ContextTree();

  @override
  String get activeContextId => _activeContext.identifier;

  @override
  void activate(String contextId) {
    final context = _contextExtensionPoint.extensionPoint.extensions.firstWhere(
        (extension) => extension.identifier == contextId,
        orElse: () => null);

    if (context != null && context.identifier != _activeContext?.identifier) {
      final activeContext = _contextTree.getOrAddNode(context.identifier, context.parentIdentifier);
      _activeContext = activeContext;

      _didChangeController.add(null);
    }
  }

  @override
  Stream<Null> get didChange => _didChangeController.stream;
}
