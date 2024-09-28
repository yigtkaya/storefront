import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storefront/dependecy_injection/inject.dart';
import 'package:storefront/features/auth/bloc/auth_bloc.dart';
import 'package:storefront/main.dart';

final class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt.call(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.when(
            initial: (_) => const MyHomePage(
              title: "a",
            ),
            authenticated: (_) => const MyHomePage(
              title: "a",
            ),
            loading: (_) => const MyHomePage(
              title: "a",
            ),
            error: (message) => const MyHomePage(
              title: "a",
            ),
          );
        },
      ),
    );
  }
}
