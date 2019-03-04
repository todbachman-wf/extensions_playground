import 'dart:html' show ButtonElement, DivElement;

import 'package:plugin/plugin.dart';

import 'workiva_plugin.dart';

class FormattingPlugin extends Plugin {
  @override
  final String uniqueIdentifier = 'formatting';

  @override
  void registerExtensionPoints(RegisterExtensionPoint register) {}

  @override
  void registerExtensions(RegisterExtension register) {
    var isBold = false;
    var isItalic = false;

    var boldButton = new ButtonElement()
      ..text = 'bold'
      ..onClick.listen((_) => new Platform().executeCommand('formatting.bold'));
    var italicButton = new ButtonElement()
      ..text = 'italic'
      ..onClick
          .listen((_) => new Platform().executeCommand('formatting.italic'));

    // commands
    register('workiva.commands', new Command('formatting.bold'));
    register('workiva.commands', new Command('formatting.italic'));

    // handlers
    register(
        'workiva.handlers',
        new Handler('formatting.bold', () {
          isBold = !isBold;
          boldButton.text = isBold ? 'BOLD' : 'bold';
        }));
    register(
        'workiva.handlers',
        new Handler('formatting.italic', () {
          isItalic = !isItalic;
          italicButton.text = isItalic ? '~italic~' : 'italic';
        }));

    // UI elements
    register('workiva.menus', new Menu(boldButton));
    register('workiva.menus', new Menu(italicButton));

    register('workiva.views', new View(new DivElement()));
  }
}
