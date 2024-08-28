class Env {
  late EnvMode _mode;

  static final Env _instance = Env._internal();

  Env._internal();

  factory Env(EnvMode mode) {
    _instance._mode = mode;
    return _instance;
  }

  static EnvMode get mode => _instance._mode;
  static const String _apiSandbox =
      'https://mobiledeveloperproof.free.beeceptor.com/';
  static const String _apiProduction =
      'https://mobiledeveloperproof.free.beeceptor.com/';

  static const label = 'Presion Tracker';

  static String get api {
    switch (_instance._mode) {
      case EnvMode.sandbox:
        return _apiSandbox;
      case EnvMode.production:
        return _apiProduction;
    }
  }
}

enum EnvMode { sandbox, production }
