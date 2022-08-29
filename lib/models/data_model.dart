import 'package:json_annotation/json_annotation.dart';
import 'package:rest_api/models/categories_model.dart';
import 'package:rest_api/models/images_model.dart';
import 'package:rest_api/models/shop_model.dart';
import 'package:rest_api/models/subcat_model.dart';
part 'data_model.g.dart';

@JsonSerializable()
class Data {
  String? sId;
  bool? onSale;
  int? salePercent;
  int? sold;
  bool? slider_new;
  bool? slider_recent;
  bool? slider_sold;
  String? date;
  String? title;
  Categories? categories;
  Subcate? subcate;
  Shop? shop;
  String? price;
  String? sale_title;
  String? sale_price;
  List<Images>? images;
  String? sV;
  bool? in_wishlist;

  Data(
      {this.sId,
      this.onSale,
      this.salePercent,
      this.sold,
      this.slider_new,
      this.slider_recent,
      this.slider_sold,
      this.date,
      this.title,
      this.categories,
      this.subcate,
      this.shop,
      this.price,
      this.sale_title,
      this.sale_price,
      this.images,
      this.sV,
      this.in_wishlist});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
