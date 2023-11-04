part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}
class ChangeTabState extends TaskState {}

class GetUsersSuccessfullyState extends TaskState {}
class GetUsersLoadingState extends TaskState {}
class GetUsersErrorState extends TaskState {}

