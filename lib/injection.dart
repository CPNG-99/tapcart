import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tapcart/data/datasources/store/store_remote_datasource.dart';
import 'package:tapcart/data/repositories/store/store_repository_impl.dart';
import 'package:tapcart/domain/repositories/store/store_repository.dart';
import 'package:tapcart/domain/usecases/store/get_store_detail.dart';
import 'package:tapcart/presentation/bloc/store/storedetail/store_detail_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => StoreDetailBloc(locator()));

  // usecases
  locator.registerLazySingleton(() => GetStoreDetail(locator()));

  // repository
  locator.registerLazySingleton<StoreRepository>(
      () => StoreRepositoryImpl(locator()));

  // datasources
  locator.registerLazySingleton<StoreRemoteDataSource>(
      () => StoreRemoteDataSourceImpl(locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
