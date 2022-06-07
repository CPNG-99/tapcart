import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tapcart/domain/usecases/store/get_store_detail.dart';

final locator = GetIt.instance;

void init() {
  // usecases
  locator.registerLazySingleton(() => GetStoreDetail(locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
