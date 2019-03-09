A basic application exploring ideas around plugins and extensions.

#### Observations:
- Use the plugin package to slowly build up an extension model similar to Eclipse's extension model.
- Use the inject.dart package for dependency injection.
- Unfortunately, inject.dart strips generic types off, so something like this doesn't seem to work:
```dart
@module
class ExtensionPointsModule {
    @provide
    ExtensionPoint<Command> provideCommandExtensionPoint() => new ExtensionPoint<Command>();
}
```