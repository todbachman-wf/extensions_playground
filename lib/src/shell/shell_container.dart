import 'package:extensions_playground/src/shell/shell.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

import 'shell_container.inject.dart' as generated;

@Injector(const [PlatformServicesModule])
abstract class Shell {
  static final create = generated.Shell$Injector.create;

  @provide
  AppShell getShell();
}
