import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tapcart/common/exception.dart';
import 'package:tapcart/data/models/cart/cart_model.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';

abstract class CartRemoteDataSource {
  Future<PurchaseResponseModel> purchase(Cart payload);
  Future<ScanCartModel> getScanCart(String purchaseId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  // ignore: constant_identifier_names
  static const BASE_URL = "https://api-tapcart.herokuapp.com";

  final http.Client client;

  CartRemoteDataSourceImpl(this.client);

  @override
  Future<PurchaseResponseModel> purchase(Cart payload) async {
    final response = await client.post(Uri.parse("$BASE_URL/api/v1/purchases"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(CartModel(cart: payload).toJson()));

    if (response.statusCode == 201) {
      return PurchaseResponseModel.fromJson(jsonDecode(response.body)["data"]);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ScanCartModel> getScanCart(String purchaseId) async {
    final response = await client
        .get(Uri.parse("$BASE_URL/api/v1/purchases/$purchaseId"));

    if (response.statusCode == 200) {
      return ScanCartModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
