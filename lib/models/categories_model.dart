import 'package:json_annotation/json_annotation.dart';
part 'categories_model.g.dart';

@JsonSerializable()
class Categories {
  String? sId;
  String? type;
  String? date;
  String? name;
  String? image;
  int? iV;

  Categories({this.sId, this.type, this.date, this.name, this.image, this.iV});

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
