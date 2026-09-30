import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../features/products/data/datasources/remote_data_source.dart';
import '../features/products/data/repositories/product_repository_impl.dart';
import '../features/products/domain/repositories/product_repository.dart';
import '../features/products/domain/usecases/get_products.dart';
import '../features/products/presentation/bloc/products_bloc.dart';

final locator = GetIt.instance;

void setupLocator() {
  // BLoCs
  locator.registerFactory(() => ProductsBloc(locator()));

  // UseCases
  locator.registerLazySingleton(() => GetProducts(locator()));

  // Repository
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: locator()),
  );

  // Data sources
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: locator()),
  );

  // External
  locator.registerLazySingleton(() => http.Client());
}
