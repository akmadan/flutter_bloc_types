import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementevent>(counterIncrementevent);
    on<CounterShowSnackbarEvent>(counterShowSnackbarEvent);
  }

  int value = 0;

  FutureOr<void> counterIncrementevent(
      CounterIncrementevent event, Emitter<CounterState> emit) {
    value = value + 1;
    emit(CounterIncrementState(val: value));
    // emit(CounterIncrementActionState());
  }

  FutureOr<void> counterShowSnackbarEvent(
      CounterShowSnackbarEvent event, Emitter<CounterState> emit) {
    emit(CounterShowSnackbarActionState());
  }
}
