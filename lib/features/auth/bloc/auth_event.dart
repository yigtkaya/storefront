part of 'auth_bloc.dart';

sealed class AuthEvent extends BaseEvent {
  AuthEvent();
  List<Object?> get props => [];
}

final class AuthStarted extends AuthEvent {}

final class AuthCodeReceivedEvent extends AuthEvent {
  final String code;

  AuthCodeReceivedEvent(this.code);

  @override
  List<Object?> get props => [code];
}

final class RefreshTokenRequested extends AuthEvent {
  final String refreshToken;

  RefreshTokenRequested(this.refreshToken);

  @override
  List<Object?> get props => [refreshToken];
}
