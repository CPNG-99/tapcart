import 'package:dartz/dartz.dart';
import 'package:tapcart/common/failure.dart';
import 'package:tapcart/domain/entities/store/store.dart';
import 'package:tapcart/domain/repositories/store/store_repository.dart';

class GetStoreDetail {
  final StoreRepository repository;

  GetStoreDetail(this.repository);

  Future<Either<Failure, Store>> execute(String storeId) {
    return repository.getStoreDetail(storeId);
  }
}
