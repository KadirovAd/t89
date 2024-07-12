import 'package:t89/src/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<User> getUser(int id);
}
