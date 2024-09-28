import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:storefront/core/bloc/base_bloc.dart';
import 'package:storefront/features/auth/domain/use_cases/get_acces_token_use_case.dart';
import 'package:storefront/features/auth/domain/use_cases/get_autharization_code_use_case.dart';
import 'package:storefront/features/auth/domain/use_cases/get_refresh_token_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// [AuthBloc] is responsible for handling the authentication process.
@injectable
final class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final GetAuthorizationCodeUseCase getAuthorizationCodeUseCase;
  final GetAccessTokenUseCase getAccessTokenUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;

  AuthBloc(
    this.getAuthorizationCodeUseCase,
    this.getAccessTokenUseCase,
    this.refreshTokenUseCase,
  ) : super(AuthInitial()) {
    // Handling the AuthStarted event
    on<AuthStarted>((event, emit) async {
      emit(AuthLoading());
      try {
        final code = await getAuthorizationCodeUseCase.call();
        final redirectUri = 'your_redirect_uri'; // Define your redirect URI here

        // Once the authorization code is obtained, proceed to get the access token
        final tokenData = await getAccessTokenUseCase.call(code, redirectUri);
        emit(
          Authenticated.authenticated(
            tokenData['access_token'],
            tokenData['refresh_token'],
          ),
        );
      } catch (error) {
        emit(AuthError(error.toString()));
      }
    });

    // Handling the AuthCodeReceivedEvent event
    on<AuthCodeReceivedEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final redirectUri = 'your_redirect_uri'; // Define your redirect URI here
        final tokenData = await getAccessTokenUseCase.call(event.code, redirectUri);

        emit(
          Authenticated.authenticated(
            tokenData['access_token'],
            tokenData['refresh_token'],
          ),
        );
      } catch (error) {
        emit(AuthError(error.toString()));
      }
    });

    // Handling the RefreshTokenRequested event
    on<RefreshTokenRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final tokenData = await refreshTokenUseCase.call(event.refreshToken);

        emit(
          Authenticated.authenticated(
            tokenData['access_token'],
            tokenData['refresh_token'],
          ),
        );
      } catch (error) {
        emit(AuthError(error.toString()));
      }
    });
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
