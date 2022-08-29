import 'package:json_annotation/json_annotation.dart';
part 'subcat_model.g.dart';

@JsonSerializable()
class Subcate {
  String? sId;
  String? date;
  String? name;
  String? parentid;
  int? iV;

  Subcate({this.sId, this.date, this.name, this.parentid, this.iV});

  factory Subcate.fromJson(Map<String, dynamic> json) =>
      _$SubcateFromJson(json);

  Map<String, dynamic> toJson() => _$SubcateToJson(this);
}
