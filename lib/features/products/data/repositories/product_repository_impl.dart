import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getProducts() async {
    return await remoteDataSource.getProducts();
  }
}
