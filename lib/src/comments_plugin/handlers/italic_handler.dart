import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class ItalicHandler implements Handler {
  final String _commandId;

  @provide
  ItalicHandler(@italicCommandId this._commandId);

  @override
  String get commandId => _commandId;

  @override
  void execute() {
    print('comments italic handler');
  }
}
