part of 'auth_bloc.dart';

sealed class AuthState extends BaseState {
  Widget when({
    required Widget Function(AuthInitial state) initial,
    required Widget Function(Authenticated state) authenticated,
    required Widget Function(AuthLoading state) loading,
    required Widget Function(AuthError message) error,
  }) {
    return switch (this) {
      Authenticated() => authenticated(this as Authenticated),
      AuthInitial() => initial(this as AuthInitial),
      AuthLoading() => loading(this as AuthLoading),
      AuthError() => error(this as AuthError),
    };
  }

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  final String accessToken;
  final String refreshToken;

  Authenticated.authenticated(this.accessToken, this.refreshToken);

  @override
  List<Object?> get props => [accessToken, refreshToken];
}

final class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
