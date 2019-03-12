import 'dart:html' show Element;

import 'package:extensions_playground/src/workiva_plugin/extension_points/view_extension_point.dart';
import 'package:inject/inject.dart';

ViewService viewService;

abstract class ViewService {
  Iterable<Element> getViewItems(String location);
}

class ViewServiceImpl implements ViewService {
  final ViewExtensionPoint _views;

  @provide
  ViewServiceImpl(this._views);

  @override
  Iterable<Element> getViewItems(String location) =>
      _views.extensionPoint.extensions
          .where((view) =>
              view.location.scheme == 'view' && view.location.host == location)
          .map((view) => view.component);
}
