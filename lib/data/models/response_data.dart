import 'package:json_annotation/json_annotation.dart';
import 'package:random_users_flutter/data/models/user.dart';

part 'response_data.g.dart';

@JsonSerializable(checked: true)
class ResponseData {
  final List<User> results;
  final Info info;

  ResponseData({required this.results, required this.info});

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable(checked: true)
class Info {
  final String seed;
  final int results;
  final int page;
  final String version;

  Info(
      {required this.seed,
      required this.results,
      required this.page,
      required this.version});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
