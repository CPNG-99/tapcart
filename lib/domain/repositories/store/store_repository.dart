import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/store/store.dart';

abstract class StoreRepository {
  Future<Either<Failure, Store>> getStoreDetail(String storeId);
}
