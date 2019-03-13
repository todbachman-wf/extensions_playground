abstract class Context {
  String get identifier;
}

class AbstractContext implements Context {
  final String identifier;

  AbstractContext(this.identifier);
}
