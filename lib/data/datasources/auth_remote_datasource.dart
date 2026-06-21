import 'package:dio/dio.dart';

import '../../domain/repositories/auth_repository.dart';
import '../models/auth_tokens_dto.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource(this._dio);

  final Dio _dio;

  Future<AuthTokensDto> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final Response<dynamic> response = await _dio.post(
      '/auth/register',
      data: {
        'fullName': fullName,
        'email': email,
        'password': password,
      },
    );

    final status = response.statusCode ?? 0;
    final data = response.data;

    if (status == 201 && data is Map<String, dynamic>) {
      return AuthTokensDto.fromJson(data);
    }

    if (data is Map<String, dynamic> &&
        data['code'] is String &&
        data['error'] is String) {
      throw AuthFailure(data['code'] as String, data['error'] as String);
    }

    throw AuthFailure('REGISTRATION_FAILED', 'Unexpected response ($status).');
  }
}
