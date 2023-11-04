import 'package:dartz/dartz.dart';
import '../../domain_layer/repsitories/base__repository.dart';
import '../data_sources/task_remote_data_sources.dart';
import '../models/_model.dart';

class TaskRepository extends BaseTaskRepository {
  BaseTaskRemoteDataSource baseTaskRemoteDataSource;
  TaskRepository(this.baseTaskRemoteDataSource);

  @override
  Future<Either<Exception, List<UserModel>>> getUsers() async {
    return baseTaskRemoteDataSource.getUsers();
  }
}
