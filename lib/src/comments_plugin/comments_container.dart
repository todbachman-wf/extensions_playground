import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/src/comments_plugin/handlers/bold_handler.dart';
import 'package:extensions_playground/src/comments_plugin/handlers/italic_handler.dart';
import 'package:extensions_playground/src/comments_plugin/views/comments_view.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

import 'comments_container.inject.dart' as generated;

@Injector(const [PlatformServicesModule, SelectionCommandsModule])
abstract class Comments {
  static final create = generated.Comments$Injector.create;

  @provide
  BoldHandler getBoldHandler();

  @provide
  ItalicHandler getItalicHandler();

  @provide
  CommentsView getCommentsView();

  @provide
  @contextExtensionPointId
  String getContextExtensionPointId();

  @provide
  @handlerExtensionPointId
  String getHandlersExtensionPointId();

  @provide
  @viewExtensionPointId
  String getViewsExtensionPointId();
}
