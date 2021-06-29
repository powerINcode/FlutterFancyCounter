import 'package:counter_app/feature_counter/ui/counter_block.dart';
import 'package:get_it/get_it.dart';

class CounterModule {
  static init(GetIt getIt) {
    getIt.registerFactory(() => CounterCubic());
  }
}