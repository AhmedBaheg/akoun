import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/result.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/register_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUseCase? registerUseCase;
  final LoginUseCase? loginUseCase;

  AuthCubit({
    this.registerUseCase,
    this.loginUseCase,
  }) : super(AuthInitial());

  Future<void> register({required UserEntity entity}) async {
    log('🎮 [AuthCubit.register] Emitting AuthLoading...');
    emit(AuthLoading());

    final result = await registerUseCase?.call(entity);

    if (result is Success<void>) {
      log('🎉 [AuthCubit.register] Success! Emitting AuthRegisterSuccess...');
      emit(AuthRegisterSuccess());
    } else if (result is Failure<void>) {
      log('⚠️ [AuthCubit.register] Failure! Message: ${result.errorMessage}. Emitting AuthFailure...');
      emit(AuthFailure(errorMessage: result.errorMessage));
    } else {
      log('❓ [AuthCubit.register] Result null or unexpected type: ${result.runtimeType}');
      emit(AuthFailure(errorMessage: 'حدث خطأ غير متوقع'));
    }
  }

  Future<void> login({required UserEntity entity}) async {
    log('🎮 [AuthCubit.login] Emitting AuthLoading...');
    emit(AuthLoading());

    final result = await loginUseCase?.call(entity);

    if (result is Success<void>) {
      log('🎉 [AuthCubit.login] Success! Emitting AuthLoginSuccess...');
      emit(AuthLoginSuccess());
    } else if (result is Failure<void>) {
      log('⚠️ [AuthCubit.login] Failure! Message: ${result.errorMessage}. Emitting AuthFailure...');
      emit(AuthFailure(errorMessage: result.errorMessage));
    } else {
      log('❓ [AuthCubit.login] Result null or unexpected type: ${result.runtimeType}');
      emit(AuthFailure(errorMessage: 'حدث خطأ غير متوقع'));
    }
  }
}
