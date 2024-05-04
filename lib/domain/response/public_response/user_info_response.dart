import 'package:json_annotation/json_annotation.dart';

import '../api_response.dart';

part 'user_info_response.g.dart';

@JsonSerializable()
class UserInfoResponse extends ApiResponse<UserInfoResult> {
  UserInfoResponse({super.msg, super.code, super.data, super.extend});

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) => _$UserInfoResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}

@JsonSerializable()
class UserInfoResult {
  UserInfoResult({
    this.isQueryPerm,
    this.mobile = "",
    this.levelName = "",
    this.avatar = "",
    this.emailPlain = "",
    this.countryId = "",
    this.sfVip,
    this.realName = "",
    this.idcardStatus,
    this.mobilePlain = "",
    this.registerUrl = "",
    this.payPasswordSetFlag = false,
    this.cashBalance,
    this.idcard = "",
    this.referralCode = "",
    this.email = "",
    this.username = "",
    this.isCmsSysn,
    this.level,
    this.userId,
    this.usaWithdraw,
  });

  int? isQueryPerm;
  String mobile;
  String levelName;
  String avatar;
  String emailPlain;
  String? countryId;
  int? sfVip;
  String realName;
  int? idcardStatus;
  String mobilePlain;
  String registerUrl;
  bool payPasswordSetFlag;
  double? cashBalance;
  String idcard;
  String referralCode;
  String email;
  String username;
  int? isCmsSysn;
  int? level;
  int? userId;
  bool? usaWithdraw;

  factory UserInfoResult.fromJson(Map<String, dynamic> json) => _$UserInfoResultFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoResultToJson(this);
}
