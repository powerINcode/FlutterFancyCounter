import 'package:counter_app/feature_counter/ui/counter_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubic extends Cubit<CounterState> {
  CounterCubic() : super(CounterState.empty());

  increment() => emit(state.copyWith(counter: state.counter + 1));

  decrement() => emit(state.copyWith(counter: state.counter - 1));
}