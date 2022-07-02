import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/exception.dart';
import 'package:tapcart/data/models/product/create_product_model.dart';
import 'package:tapcart/domain/entities/product/createDTO.dart';
import 'package:http/http.dart' as http;

abstract class ProductCrudHelper {
  Future<void> create(CreateDTO payload);
}

class ProductCrudHelperImpl implements ProductCrudHelper {

  static const BASE_URL = "https://api-tapcart.herokuapp.com";

  final http.Client client;

  ProductCrudHelperImpl(this.client);

  @override
  Future<void> create(CreateDTO payload) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString(ACCESS_TOKEN);
    final response = await client.post(Uri.parse("$BASE_URL/auth/v1/products"),
        headers: {"Authorization": "Bearer $token"},
        body: jsonEncode(CreateProductModel(payload).toJson()));

    if (response.statusCode == 201) {
      return;
    } else {
      throw ServerException();
    }
  }

}
