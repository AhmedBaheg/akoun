import 'dart:developer';

import 'package:akoun/features/island/domain/use_case/get_island_list_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/network/result.dart';
import '../../../domain/entity/island_entity.dart';

part 'island_state.dart';

class IslandCubit extends Cubit<IslandState> {
  final GetIslandListUseCase? getIslandListUseCase;

  IslandCubit({this.getIslandListUseCase}) : super(IslandInitial());

  Future<void> getIslandList() async {
    log('🎮 [IslandCubit.getIslandList] Emitting IslandLoading...');
    emit(IslandLoading());

    final result = await getIslandListUseCase?.call();

    if (result is Success<List<IslandEntity>>) {
      log('🎉 [IslandCubit.getIslandList] Success! Returned list length: ${result.data.length}');
      emit(IslandSuccess(islandList: result.data));
    } else if (result is Failure<List<IslandEntity>>) {
      log('⚠️ [IslandCubit.getIslandList] Failure: ${result.errorMessage}');
      emit(IslandFailure(errorMessage: result.errorMessage));
    } else {
      log('❓ [IslandCubit.getIslandList] Result null or unexpected type');
      emit(IslandFailure(errorMessage: 'حدث خطأ غير متوقع'));
    }
  }
}
