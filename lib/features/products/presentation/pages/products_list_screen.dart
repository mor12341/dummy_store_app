import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/locator.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ProductsBloc>()..add(FetchProductsEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsLoaded) {
              return GridView.builder(
                padding: EdgeInsets.all(2.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 2.w,
                  mainAxisSpacing: 2.h,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return GestureDetector(
                    onTap: () => context.push('/product/${product.id}'),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.network(
                              product.thumbnail,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2.w),
                            child: Text(
                              product.title,
                              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                            child: Text(
                              '\$${product.price}',
                              style: TextStyle(fontSize: 14.sp, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is ProductsError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
