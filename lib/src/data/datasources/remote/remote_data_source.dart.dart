import 'dart:convert';

import 'package:http/http.dart' as http; // Import the http package
import 'package:t89/src/core/constants/api_constants.dart';
import 'package:t89/src/core/error/exceptions.dart';
import 'package:t89/src/data/models/user_model.dart';


abstract class RemoteDataSource {
  Future<UserModel> getUser(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client; // Ensure you use http.Client here

  RemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> getUser(int id) async {
    final response = await client.get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getUserEndpoint}/$id'));
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
