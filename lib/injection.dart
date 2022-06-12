import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tapcart/data/datasources/auth/auth_remote_datasource.dart';
import 'package:tapcart/data/datasources/db/database_helper.dart';
import 'package:tapcart/data/datasources/product/product_remote_datasource.dart';
import 'package:tapcart/data/datasources/shared_preference/preference_helper.dart';
import 'package:tapcart/data/datasources/store/store_remote_datasource.dart';
import 'package:tapcart/data/repositories/auth/auth_repository.dart';
import 'package:tapcart/data/repositories/product/product_repository_impl.dart';
import 'package:tapcart/data/repositories/store/store_repository_impl.dart';
import 'package:tapcart/domain/repositories/auth/auth_repository.dart';
import 'package:tapcart/domain/repositories/product/product_repository.dart';
import 'package:tapcart/domain/repositories/store/store_repository.dart';
import 'package:tapcart/domain/usecases/auth/login.dart';
import 'package:tapcart/domain/usecases/product/get_product_list.dart';
import 'package:tapcart/domain/usecases/store/get_store_detail.dart';
import 'package:tapcart/presentation/bloc/product/productlist/product_list_bloc.dart';
import 'package:tapcart/presentation/bloc/store/storedetail/store_detail_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => StoreDetailBloc(locator()));
  locator.registerFactory(() => ProductListBloc(locator()));

  // usecases
  locator.registerLazySingleton(() => Login(locator()));
  locator.registerLazySingleton(() => GetStoreDetail(locator()));
  locator.registerLazySingleton(() => GetProductList(locator()));

  // repository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()));
  locator.registerLazySingleton<StoreRepository>(
      () => StoreRepositoryImpl(locator()));
  locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(locator()));

  // datasources
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<StoreRemoteDataSource>(
      () => StoreRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(locator()));

  // helper
  locator.registerLazySingleton<PreferenceHelper>(
      () => PreferenceHelper(locator()));
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
