import 'package:json_annotation/json_annotation.dart';
part "shop_model.g.dart";

@JsonSerializable()
class Shop {
  String? sId;
  bool? is_active;
  String? createdAt;
  String? name;
  String? description;
  String? shopemail;
  String? shopaddress;
  String? shopcity;
  String? userid;
  String? image;
  int? iV;

  Shop(
      {this.sId,
      this.is_active,
      this.createdAt,
      this.name,
      this.description,
      this.shopemail,
      this.shopaddress,
      this.shopcity,
      this.userid,
      this.image,
      this.iV});

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
