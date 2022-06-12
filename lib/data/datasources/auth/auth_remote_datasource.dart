import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/exception.dart';
import 'package:tapcart/data/models/auth/auth_model.dart';
import 'package:tapcart/data/models/store/store_detail_model.dart';
import 'package:tapcart/domain/entities/Auth/auth.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(LoginDTO payload);
  Future<StoreModelData> getMemberInfo();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // ignore: constant_identifier_names
  static const BASE_URL = "https://api-tapcart.herokuapp.com";

  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<AuthModel> login(LoginDTO payload) async {
    final response = await client.post(Uri.parse("$BASE_URL/auth/v1/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(LoginModel(payload).toJson()));

    if (response.statusCode == 200) {
      return AuthModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<StoreModelData> getMemberInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString(ACCESS_TOKEN);
    final response = await client.get(Uri.parse("$BASE_URL/api/v1/users"),
        headers: {"Authorization": "Bearer $token"});

    if (response.statusCode == 200) {
      return StoreModelData.fromJson(jsonDecode(response.body)["data"]);
    } else {
      throw ServerException();
    }
  }
}
