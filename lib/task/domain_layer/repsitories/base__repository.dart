import 'package:dartz/dartz.dart';
import '../../data_layer/models/_model.dart';

abstract class BaseTaskRepository {
  Future<Either<Exception, List<UserModel>>> getUsers();
}
