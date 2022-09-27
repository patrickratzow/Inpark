library plugin;

class PluginManager {
  static final _instance = PluginManager._internal();

  factory PluginManager() => _instance;
  PluginManager._internal();

  final Set<Plugin> _plugins = {};

  void registerPlugin(Plugin plugin) {
    _plugins.add(plugin);
  }

  List<Plugin> get plugins => _plugins.toList();
}

abstract class PluginService {
  void init();
  List<dynamic> registerProviders();
}

class Plugin {
  final List<dynamic> Function() registerProviders;

  Plugin({required this.registerProviders});
}
