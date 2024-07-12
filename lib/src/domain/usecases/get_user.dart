
import 'package:t89/src/core/usecases/usecase.dart';
import 'package:t89/src/domain/entities/user.dart';
import 'package:t89/src/domain/repositories/authentication_repository.dart';

class GetUser implements UseCase<User, int> {
  final AuthenticationRepository repository;

  GetUser(this.repository);

  @override
  Future<User> call(int id) async {
    return await repository.getUser(id);
  }
}
