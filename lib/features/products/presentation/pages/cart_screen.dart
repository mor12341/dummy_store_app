import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Center(
        child: Text(
          'Your Cart is Empty',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
    );
  }
}
