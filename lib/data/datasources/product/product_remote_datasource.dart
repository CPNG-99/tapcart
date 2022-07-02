import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tapcart/common/exception.dart';
import 'package:tapcart/data/models/product/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModelData>> getProductList(String storeId);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  // ignore: constant_identifier_names
  static const BASE_URL = "https://api-tapcart.herokuapp.com";
  final http.Client client;

  ProductRemoteDataSourceImpl(this.client);

  @override
  Future<List<ProductModelData>> getProductList(String storeId) async {
    final response = await client
        .get(Uri.parse("$BASE_URL/api/v1/products?store_id=$storeId"));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body)).data;
    } else {
      throw ServerException();
    }
  }
}
