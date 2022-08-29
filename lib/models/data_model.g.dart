// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      sId: json['sId'] as String?,
      onSale: json['onSale'] as bool?,
      salePercent: json['salePercent'] as int?,
      sold: json['sold'] as int?,
      slider_new: json['slider_new'] as bool?,
      slider_recent: json['slider_recent'] as bool?,
      slider_sold: json['slider_sold'] as bool?,
      date: json['date'] as String?,
      title: json['title'] as String?,
      categories: json['categories'] == null
          ? null
          : Categories.fromJson(json['categories'] as Map<String, dynamic>),
      subcate: json['subcate'] == null
          ? null
          : Subcate.fromJson(json['subcate'] as Map<String, dynamic>),
      shop: json['shop'] == null
          ? null
          : Shop.fromJson(json['shop'] as Map<String, dynamic>),
      price: json['price'] as String?,
      sale_title: json['sale_title'] as String?,
      sale_price: json['sale_price'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      sV: json['sV'] as String?,
      in_wishlist: json['in_wishlist'] as bool?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'sId': instance.sId,
      'onSale': instance.onSale,
      'salePercent': instance.salePercent,
      'sold': instance.sold,
      'slider_new': instance.slider_new,
      'slider_recent': instance.slider_recent,
      'slider_sold': instance.slider_sold,
      'date': instance.date,
      'title': instance.title,
      'categories': instance.categories,
      'subcate': instance.subcate,
      'shop': instance.shop,
      'price': instance.price,
      'sale_title': instance.sale_title,
      'sale_price': instance.sale_price,
      'images': instance.images,
      'sV': instance.sV,
      'in_wishlist': instance.in_wishlist,
    };
