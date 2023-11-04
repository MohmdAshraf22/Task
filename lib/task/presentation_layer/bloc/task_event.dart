part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class ChangeTabEvent extends TaskEvent {
  final int index ;
  ChangeTabEvent(this.index);
}
class GetUsersEvent extends TaskEvent {
  GetUsersEvent();
}