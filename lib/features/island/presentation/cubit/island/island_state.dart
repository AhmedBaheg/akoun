part of 'island_cubit.dart';

@immutable
sealed class IslandState {}

final class IslandInitial extends IslandState {}
final class IslandLoading extends IslandState {}
final class IslandSuccess extends IslandState {
  final List<IslandEntity> islandList;

  IslandSuccess({required this.islandList});
}
final class IslandFailure extends IslandState {
  final String errorMessage;

  IslandFailure({required this.errorMessage});
}
