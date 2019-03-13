import 'package:extensions_playground/selection_plugin.dart';
import 'package:extensions_playground/workiva_plugin.dart';
import 'package:inject/inject.dart';

class BoldHandler implements Handler {
  final String _commandId;

  @provide
  BoldHandler(@boldCommandId this._commandId);

  @override
  String get commandId => _commandId;

  @override
  void execute() {
    print('comments bold handler');
  }
}
