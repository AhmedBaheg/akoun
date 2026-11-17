part of 'child_cubit.dart';

@immutable
sealed class ChildState {}

final class ChildInitial extends ChildState {}
final class ChildLoading extends ChildState {}
final class ChildSuccess extends ChildState {
  final ChildEntity childEntity;

  ChildSuccess({required this.childEntity});
}
final class ChildFailure extends ChildState {
  final String errorMessage;

  ChildFailure({required this.errorMessage});
}
