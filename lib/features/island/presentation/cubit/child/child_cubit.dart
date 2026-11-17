import 'dart:developer';

import 'package:akoun/features/island/domain/use_case/get_child_profile_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/network/result.dart';
import '../../../domain/entity/child_entity.dart';

part 'child_state.dart';

class ChildCubit extends Cubit<ChildState> {
  final GetChildProfileUseCase? getChildProfileUseCase;

  ChildCubit({this.getChildProfileUseCase}) : super(ChildInitial());

  Future<void> getChildProfile() async {
    log('🎮 [ChildCubit.getChildProfile] Emitting ChildLoading...');
    emit(ChildLoading());

    final result = await getChildProfileUseCase?.getChildProfile();

    if (result is Success<ChildEntity>) {
      log('🎉 [ChildCubit.getChildProfile] Success for child: ${result.data.childName ?? result.data.name}');
      emit(ChildSuccess(childEntity: result.data));
    } else if (result is Failure<ChildEntity>) {
      log('⚠️ [ChildCubit.getChildProfile] Failure: ${result.errorMessage}');
      emit(ChildFailure(errorMessage: result.errorMessage));
    } else {
      log('❓ [ChildCubit.getChildProfile] Unexpected result type');
      emit(ChildFailure(errorMessage: 'حدث خطأ غير متوقع'));
    }
  }
}
