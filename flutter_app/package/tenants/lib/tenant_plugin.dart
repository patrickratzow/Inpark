import 'package:plugin/plugin_manager.dart';
import 'package:provider/provider.dart';
import 'package:tenants/common/ioc.dart';
import 'package:tenants/models/location_model.dart';

import 'models/park_model.dart';

class TenantPlugin implements PluginService {
  @override
  void init() {
    setupIoC();
    var pluginManager = PluginManager();
    var plugin = Plugin(registerProviders: () => registerProviders());

    pluginManager.registerPlugin(plugin);
  }

  @override
  List<dynamic> registerProviders() {
    return [
      ChangeNotifierProvider<ParkModel>(
        create: (context) => ParkModel(),
      ),
      ChangeNotifierProvider<LocationModel>(
        create: (context) => LocationModel(),
      ),
    ];
  }
}
