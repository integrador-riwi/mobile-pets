import 'package:equatable/equatable.dart';

import '../../../domain/entities/auth_tokens.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(this.tokens);

  final AuthTokens tokens;

  @override
  List<Object?> get props => [tokens];
}

class AuthError extends AuthState {
  const AuthError(this.code, this.message);

  final String code;
  final String message;

  @override
  List<Object?> get props => [code, message];
}
