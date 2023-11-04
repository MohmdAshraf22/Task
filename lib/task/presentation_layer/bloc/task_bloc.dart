import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/task/data_layer/models/_model.dart';
import 'package:task/task/presentation_layer/components/components.dart';

import '../../../core/services/dep_injection.dart';
import '../../domain_layer/use_cases/_usecase.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  int currentTabIndex = 0;
  List<UserModel> users = [];
  List<Widget> tabs = const [CategoriesTab(), ServicesTab(), NoOrderTab()];
  Widget currentTab = const CategoriesTab();
  static TaskBloc get(BuildContext context) =>
      BlocProvider.of<TaskBloc>(context);
  TaskBloc(TaskInitial taskInitial) : super(TaskInitial()) {
    on<TaskEvent>((event, emit) async {
      if (event is ChangeTabEvent) {
        currentTabIndex = event.index;
        currentTab = tabs[currentTabIndex];
        emit(ChangeTabState());
      } else if (event is GetUsersEvent) {
        emit(GetUsersLoadingState());
        final result = await GetUsersUseCase(sl()).get();
        result.fold((l) {
          emit(GetUsersErrorState());
        }, (r) {
          users = r;
          print(users);
          emit(GetUsersSuccessfullyState());
        });
      }
    });
  }
}
