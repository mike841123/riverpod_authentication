import 'package:json_annotation/json_annotation.dart';
import '../api_response.dart';

part 'normal_response.g.dart';

@JsonSerializable()
class NormalResponse extends ApiResponse<Result> {
  NormalResponse({super.msg, super.code, super.data, super.extend});

  factory NormalResponse.fromJson(Map<String, dynamic> json) => _$NormalResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NormalResponseToJson(this);
}

@JsonSerializable()
class Result {
  Result({this.result = false});

  bool result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
