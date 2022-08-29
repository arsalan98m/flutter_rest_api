import 'package:json_annotation/json_annotation.dart';
import 'package:rest_api/models/data_model.dart';
part 'products_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Products {
  bool success;
  String message;
  List<Data> data;

  Products({required this.success, required this.message, required this.data});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
