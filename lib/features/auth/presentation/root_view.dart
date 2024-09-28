import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storefront/dependecy_injection/inject.dart';
import 'package:storefront/features/auth/bloc/auth_bloc.dart';
import 'package:storefront/features/auth/presentation/get_started_view.dart';

final class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt.call(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.when(
            initial: (_) => const GetStartedView(),
            authenticated: (_) => const GetStartedView(),
            loading: (_) => const GetStartedView(),
            error: (message) => const GetStartedView(),
          );
        },
      ),
    );
  }
}
