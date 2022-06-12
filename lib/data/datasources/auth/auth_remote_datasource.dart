import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tapcart/common/exception.dart';
import 'package:tapcart/data/models/auth/auth_model.dart';
import 'package:tapcart/domain/entities/Auth/auth.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(LoginDTO payload);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // ignore: constant_identifier_names
  static const BASE_URL = "https://api-tapcart.herokuapp.com";

  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<AuthModel> login(LoginDTO payload) async {
    final response =
        await client.post(Uri.parse("$BASE_URL/auth/v1/login"), body: payload);

    if (response.statusCode == 200) {
      return AuthModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
