import 'dart:html' show Element;

import 'package:extensions_playground/src/workiva_plugin/extension_points/view_extension_point.dart';
import 'package:inject/inject.dart';

ViewService viewService;

abstract class ViewService {
  Iterable<Element> getAllViewItems();
}

class ViewServiceImpl implements ViewService {
  final ViewExtensionPoint _views;

  @provide
  ViewServiceImpl(this._views);

  @override
  Iterable<Element> getAllViewItems() =>
      _views.extensionPoint.extensions.map((view) => view.component);
}
