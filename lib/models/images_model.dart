import 'package:json_annotation/json_annotation.dart';
part 'images_model.g.dart';

@JsonSerializable()
class Images {
  String? sId;
  String? filename;
  String? url;

  Images({this.sId, this.filename, this.url});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}
