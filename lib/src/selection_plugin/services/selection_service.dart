import 'dart:async';

import 'package:extensions_playground/src/selection_plugin/extension_points/selection_provider_extension_point.dart';
import 'package:extensions_playground/workiva_plugin.dart';

SelectionService selectionService;

abstract class SelectionService {
  bool get isBold;
  bool get isItalic;
  Stream<Null> get didChange;
}

class SelectionServiceImpl implements SelectionService {
  bool _isBold = false;
  bool _isItalic = false;
  StreamController<Null> _didChangeController =
      new StreamController<Null>.broadcast();
  SelectionProviderExtensionPoint _extensionPoint;
  ContextService _contextService;
  StreamSubscription<Null> _providerSub;

  SelectionServiceImpl(this._extensionPoint, this._contextService) {
    _contextService.didChange.listen(_handleContextDidChange);
  }

  Stream<Null> get didChange => _didChangeController.stream;

  @override
  bool get isBold => _isBold;

  @override
  bool get isItalic => _isItalic;

  void _handleContextDidChange(Null _) {
    var activeProvider = _extensionPoint.extensionPoint.extensions.firstWhere(
        (provider) => provider.contextId == _contextService.activeContextId,
        orElse: () => null);

    if (activeProvider == null) {
      return;
    }

    _updateFormatting(activeProvider);

    _providerSub?.cancel();
    _providerSub = activeProvider.didChange.listen((_) {
      _updateFormatting(activeProvider);
    });
  }

  void _updateFormatting(SelectionProvider provider) {
    var changed = false;

    if (provider.isBold != _isBold) {
      _isBold = provider.isBold;
      changed = true;
    }
    if (provider.isItalic != _isItalic) {
      _isItalic = provider.isItalic;
      changed = true;
    }

    if (changed) {
      _didChangeController.add(null);
    }
  }
}
