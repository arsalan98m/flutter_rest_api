// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      sId: json['sId'] as String?,
      type: json['type'] as String?,
      date: json['date'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'type': instance.type,
      'date': instance.date,
      'name': instance.name,
      'image': instance.image,
      'iV': instance.iV,
    };
