import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_event.dart';
part 'base_state.dart';

abstract base class BaseBloc<E extends BaseEvent, S extends BaseState> extends Bloc<E, S> {
  BaseBloc(super.initialState) {
    on<E>((event, emit) {
      // Base implementation for handling events.
      // Specific logic can be added in child classes.
      onBindingCreated();
    });
  }
  void safeEmit(S state, Emitter<S> emit) {
    if (!isClosed) {
      emit(state);
    }
  }

  @mustCallSuper
  void onBindingCreated() {}
}
