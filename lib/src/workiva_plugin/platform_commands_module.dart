import 'package:extensions_playground/src/workiva_plugin/commands/platform_commands.dart';
import 'package:extensions_playground/src/workiva_plugin/constants.dart';
import 'package:inject/inject.dart';

@module
class PlatformCommandsModule {
  @provide
  @createDocumentCommandId
  String provideCreateDocumentCommandId() => '$workivaPluginId.createDocument';
}
