import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  const ProductModel({
    required int id,
    required String title,
    required String description,
    required double price,
    required String thumbnail,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          thumbnail: thumbnail,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
