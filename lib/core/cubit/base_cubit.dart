import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'base_state.dart';

abstract base class BaseCubit<S extends BaseState> extends HydratedCubit<S> implements StateStreamableSource<S> {
  BaseCubit(super.initialState) {
    onBindingCreated();
  }

  void safeEmit(S state) {
    if (!isClosed) {
      emit(state);
    }
  }

  @mustCallSuper
  void onBindingCreated() {}
}
