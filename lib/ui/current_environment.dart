class CurrentEnvironment {
  static const Environment environment = Environment.testing;

  static bool get isProduction =>
      environment == Environment.production;

  static bool get isTesting => environment == Environment.testing;

  static bool get isMock => environment == Environment.mock;
}

enum Environment { production, testing, mock }
