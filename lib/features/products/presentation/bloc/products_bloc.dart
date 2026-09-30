import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_products.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts getProducts;

  ProductsBloc(this.getProducts) : super(ProductsInitial()) {
    on<FetchProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      try {
        final products = await getProducts();
        emit(ProductsLoaded(products: products));
      } catch (e) {
        emit(ProductsError(message: e.toString()));
      }
    });
  }
}
