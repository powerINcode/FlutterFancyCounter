import 'package:counter_app/app_theme.dart';
import 'package:counter_app/application_router.dart';
import 'package:counter_app/feature_counter/di/counter_module.dart';
import 'package:get_it/get_it.dart';

class ApplicationModule {

  static T get<T extends Object>() {
    return GetIt.instance.get<T>();
  }

  static init() {
    final GetIt getIt = GetIt.instance;
    getIt.registerSingleton<ApplicationRouter>(ApplicationRouter());
    getIt.registerSingleton<ApplicationTheme>(ApplicationTheme());

    _initModules(getIt);
  }

  static _initModules(GetIt getIt) {
    CounterModule.init(getIt);
  }
}