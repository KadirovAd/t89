
import 'package:t89/src/core/error/exceptions.dart';
import 'package:t89/src/data/datasources/remote/remote_data_source.dart.dart';
import 'package:t89/src/domain/entities/user.dart';
import 'package:t89/src/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final RemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> getUser(int id) async {
    try {
      final user = await remoteDataSource.getUser(id);
      return user;
    } on ServerException {
      throw Exception('Failed to load user');
    }
  }
}
