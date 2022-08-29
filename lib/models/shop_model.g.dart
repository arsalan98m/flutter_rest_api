// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      sId: json['sId'] as String?,
      is_active: json['is_active'] as bool?,
      createdAt: json['createdAt'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      shopemail: json['shopemail'] as String?,
      shopaddress: json['shopaddress'] as String?,
      shopcity: json['shopcity'] as String?,
      userid: json['userid'] as String?,
      image: json['image'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'sId': instance.sId,
      'is_active': instance.is_active,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'description': instance.description,
      'shopemail': instance.shopemail,
      'shopaddress': instance.shopaddress,
      'shopcity': instance.shopcity,
      'userid': instance.userid,
      'image': instance.image,
      'iV': instance.iV,
    };
