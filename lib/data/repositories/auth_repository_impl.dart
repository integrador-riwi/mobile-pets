import 'package:dio/dio.dart';

import '../../core/storage/token_storage.dart';
import '../../domain/entities/auth_tokens.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote, this._tokenStorage);

  final AuthRemoteDataSource _remote;
  final TokenStorage _tokenStorage;

  @override
  Future<AuthTokens> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final dto = await _remote.register(
        fullName: fullName,
        email: email,
        password: password,
      );
      await _tokenStorage.save(
        accessToken: dto.accessToken,
        refreshToken: dto.refreshToken,
      );
      return dto.toEntity();
    } on DioException catch (e) {
      throw AuthFailure(
        'NETWORK_ERROR',
        e.message ?? 'Could not reach the server.',
      );
    }
  }
}
