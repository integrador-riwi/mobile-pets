import '../entities/auth_tokens.dart';

abstract class AuthRepository {
  Future<AuthTokens> register({
    required String fullName,
    required String email,
    required String password,
  });
}

class AuthFailure implements Exception {
  AuthFailure(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => 'AuthFailure($code): $message';
}
