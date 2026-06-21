import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repository) : super(const AuthInitial());

  final AuthRepository _repository;

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());
    try {
      final tokens = await _repository.register(
        fullName: fullName,
        email: email,
        password: password,
      );
      emit(AuthAuthenticated(tokens));
    } on AuthFailure catch (e) {
      emit(AuthError(e.code, e.message));
    }
  }

  void reset() => emit(const AuthInitial());
}
