import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tapcart/common/exception.dart';
import 'package:tapcart/data/models/store/store_detail_model.dart';

abstract class StoreRemoteDataSource {
  Future<StoreModel> getStoreDetail(String storeId);
}

class StoreRemoteDataSourceImpl implements StoreRemoteDataSource {
  // ignore: constant_identifier_names
  static const BASE_URL = "https://api-tapcart.herokuapp.com";

  final http.Client client;

  StoreRemoteDataSourceImpl(this.client);

  @override
  Future<StoreModel> getStoreDetail(String storeId) async {
    final response =
        await client.get(Uri.parse("$BASE_URL/api/v1/stores/$storeId"));

    if (response.statusCode == 200) {
      return StoreModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
