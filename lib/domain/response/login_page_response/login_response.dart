import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends ApiResponse<LoginResult>{
  LoginResponse({String msg = "", int code = 1, LoginResult? data, dynamic extend}) : super(msg: msg, code: code, data: data, extend: extend);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginResult {
  LoginResult({this.access_token, this.expires_in, this.refresh_token, this.scope, this.token_type});

  String? access_token;
  int? expires_in;
  String? refresh_token;
  String? scope;
  String? token_type;

  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}
