import 'package:dartz/dartz.dart';
import 'package:task/core/remote/dio_helper.dart';
import 'package:task/task/data_layer/models/_model.dart';

abstract class BaseTaskRemoteDataSource {
  Future<Either<Exception, List<UserModel>>> getUsers();
}

class TaskRemoteDataSource extends BaseTaskRemoteDataSource {
  @override
  Future<Either<Exception, List<UserModel>>> getUsers() async {
    try {
      List<UserModel> users = [];
      await DioHelper.getData(path: "users").then((value) {
        for (var element in value.data) {
          users.add(UserModel.fromJson(element));
        }
      });
      return Right(users);
    } on Exception catch (error) {
      return Left(error);
    }
  }
}
