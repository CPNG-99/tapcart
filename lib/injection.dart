import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tapcart/data/datasources/auth/auth_remote_datasource.dart';
import 'package:tapcart/data/datasources/cart/cart_remote_datasource.dart';
import 'package:tapcart/data/datasources/db/database_helper.dart';
import 'package:tapcart/data/datasources/product/prodcut_crud_helper.dart';
import 'package:tapcart/data/datasources/product/product_remote_datasource.dart';
import 'package:tapcart/data/datasources/store/store_remote_datasource.dart';
import 'package:tapcart/data/repositories/auth/auth_repository.dart';
import 'package:tapcart/data/repositories/cart/cart_repository_impl.dart';
import 'package:tapcart/data/repositories/product/crud_repository_impl.dart';
import 'package:tapcart/data/repositories/product/product_repository_impl.dart';
import 'package:tapcart/data/repositories/store/store_repository_impl.dart';
import 'package:tapcart/domain/repositories/auth/auth_repository.dart';
import 'package:tapcart/domain/repositories/cart/cart_repository.dart';
import 'package:tapcart/domain/repositories/product/crud_product_repository.dart';
import 'package:tapcart/domain/repositories/product/product_repository.dart';
import 'package:tapcart/domain/repositories/store/store_repository.dart';
import 'package:tapcart/domain/usecases/auth/get_member_detail.dart';
import 'package:tapcart/domain/usecases/auth/login.dart';
import 'package:tapcart/domain/usecases/cart/get_scan_cart.dart';
import 'package:tapcart/domain/usecases/cart/submit_cart.dart';
import 'package:tapcart/domain/usecases/product/create_product.dart';
import 'package:tapcart/domain/usecases/product/delete_product.dart';
import 'package:tapcart/domain/usecases/product/get_product_list.dart';
import 'package:tapcart/domain/usecases/product/update_product.dart';
import 'package:tapcart/domain/usecases/store/get_store_detail.dart';
import 'package:tapcart/presentation/bloc/auth/login/login_bloc.dart';
import 'package:tapcart/presentation/bloc/auth/member_detail/member_detail_bloc.dart';
import 'package:tapcart/presentation/bloc/cart/get_scan_cart/get_scan_cart_bloc.dart';
import 'package:tapcart/presentation/bloc/cart/purchase/purchase_bloc.dart';
import 'package:tapcart/presentation/bloc/product/create_product/create_product_bloc.dart';
import 'package:tapcart/presentation/bloc/product/delete_product/delete_product_bloc.dart';
import 'package:tapcart/presentation/bloc/product/productlist/product_list_bloc.dart';
import 'package:tapcart/presentation/bloc/product/update_product/update_product_bloc.dart';
import 'package:tapcart/presentation/bloc/store/storedetail/store_detail_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => LoginBloc(locator()));
  locator.registerFactory(() => MemberDetailBloc(locator()));
  locator.registerFactory(() => StoreDetailBloc(locator()));
  locator.registerFactory(() => ProductListBloc(locator()));
  locator.registerFactory(() => PurchaseBloc(locator()));
  locator.registerFactory(() => CreateProductBloc(locator()));
  locator.registerFactory(() => UpdateProductBloc(locator()));
  locator.registerFactory(() => DeleteProductBloc(locator()));
  locator.registerLazySingleton(() => GetScanCartBloc(locator()));

  // usecases
  locator.registerLazySingleton(() => Login(locator()));
  locator.registerLazySingleton(() => GetMemberDetail(locator()));
  locator.registerLazySingleton(() => GetStoreDetail(locator()));
  locator.registerLazySingleton(() => GetProductList(locator()));
  locator.registerLazySingleton(() => CartPurchase(locator()));
  locator.registerLazySingleton(() => CreateProduct(locator()));
  locator.registerLazySingleton(() => UpdateProduct(locator()));
  locator.registerLazySingleton(() => DeleteProduct(locator()));
  locator.registerLazySingleton(() => GetScanCart(locator()));

  // repository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()));
  locator.registerLazySingleton<StoreRepository>(
      () => StoreRepositoryImpl(locator()));
  locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(locator()));
  locator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(locator()));
  locator.registerLazySingleton<CrudRepository>(
      () => CrudRepositoryImpl(locator()));

  // datasources
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<StoreRemoteDataSource>(
      () => StoreRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<ProductCrudHelper>(
      () => ProductCrudHelperImpl(locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
