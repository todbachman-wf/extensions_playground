import 'package:plugin/manager.dart';
import 'package:extensions_playground/extensions_playground.dart';

Future<Null> main() async {
  var workivaPlugin = new WorkivaPlugin();
  await workivaPlugin.init();

  var formattingPlugin = await FormattingPlugin();
  await formattingPlugin.init();

  var manager = new ExtensionManager();
  manager.processPlugins([
    workivaPlugin,
    formattingPlugin,
  ]);

  var shell = await Shell.create(new PlatformServicesModule());
  shell.getShell().render();
}
