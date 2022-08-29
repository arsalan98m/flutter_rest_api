// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subcate _$SubcateFromJson(Map<String, dynamic> json) => Subcate(
      sId: json['sId'] as String?,
      date: json['date'] as String?,
      name: json['name'] as String?,
      parentid: json['parentid'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$SubcateToJson(Subcate instance) => <String, dynamic>{
      'sId': instance.sId,
      'date': instance.date,
      'name': instance.name,
      'parentid': instance.parentid,
      'iV': instance.iV,
    };
