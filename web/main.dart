import 'package:extensions_playground/comments_plugin.dart';
import 'package:extensions_playground/document_plugin.dart';
import 'package:extensions_playground/edit_toolbar_plugin.dart';
import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/shell.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:plugin/manager.dart';

Future<Null> main() async {
  var workivaPlugin = new WorkivaPlugin();
  await workivaPlugin.init();

  var selectionPlugin = new SelectionPlugin();
  await selectionPlugin.init();

  var documentPlugin = new DocumentPlugin();
  await documentPlugin.init();

  var editToolbarPlugin = new EditToolbarPlugin();
  await editToolbarPlugin.init();

  var commentsPlugin = new CommentsPlugin();
  await commentsPlugin.init();

  var manager = new ExtensionManager();
  manager.processPlugins([
    workivaPlugin,
    selectionPlugin,
    documentPlugin,
    editToolbarPlugin,
    commentsPlugin,
  ]);

  await createShell();
}
