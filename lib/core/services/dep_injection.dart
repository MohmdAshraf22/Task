
import 'package:get_it/get_it.dart';

import '../../task/data_layer/data_sources/task_remote_data_sources.dart';
import '../../task/data_layer/repositories/task_repository.dart';
import '../../task/domain_layer/repsitories/base__repository.dart';
import '../../task/presentation_layer/bloc/task_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    /// Task
    BaseTaskRemoteDataSource baseTaskRemoteDataSource = TaskRemoteDataSource();
    sl.registerLazySingleton(() => baseTaskRemoteDataSource);

    BaseTaskRepository baseTaskRepository = TaskRepository(sl());
    sl.registerLazySingleton(() => baseTaskRepository);

    /// blocs
    TaskBloc taskBloc = TaskBloc(TaskInitial());
    sl.registerLazySingleton(() => taskBloc);

  }
}
