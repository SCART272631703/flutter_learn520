import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable()
class Page {
  int? pageNo;
  int? pageSize;
  int? count;

  Page({
    this.pageNo,
    this.pageSize,
    this.count,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}
