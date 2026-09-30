import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $productId')),
      body: Center(
        child: Text(
          'Details for Product ID: $productId',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
    );
  }
}
