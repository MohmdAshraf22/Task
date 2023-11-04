import 'package:dartz/dartz.dart';
import '../../data_layer/models/_model.dart';
import '../repsitories/base__repository.dart';

class GetUsersUseCase {
  final BaseTaskRepository baseTaskRepository;
  GetUsersUseCase(this.baseTaskRepository);

  Future<Either<Exception, List<UserModel>>> get() async {
    return await baseTaskRepository.getUsers();
  }
}
