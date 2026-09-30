import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import '../models/product_model.dart';

abstract class RemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getProducts() async {
    const url = 'https://dummyjson.com/products';

    final response = await retry(
      () async {
        final res = await client.get(Uri.parse(url));
        if (res.statusCode == 200) {
          return res;
        } else {
          throw Exception('Failed to load products');
        }
      },
      retryIf: (e) => e is Exception,
      maxAttempts: 3,
    );

    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> productsJson = jsonResponse['products'];
    
    return productsJson.map((json) => ProductModel.fromJson(json)).toList();
  }
}
