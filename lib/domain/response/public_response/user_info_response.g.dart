// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) =>
    UserInfoResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: json['data'] == null
          ? null
          : UserInfoResult.fromJson(json['data'] as Map<String, dynamic>),
      extend: json['extend'],
    );

Map<String, dynamic> _$UserInfoResponseToJson(UserInfoResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

UserInfoResult _$UserInfoResultFromJson(Map<String, dynamic> json) =>
    UserInfoResult(
      isQueryPerm: (json['isQueryPerm'] as num?)?.toInt(),
      mobile: json['mobile'] as String? ?? "",
      levelName: json['levelName'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      emailPlain: json['emailPlain'] as String? ?? "",
      countryId: json['countryId'] as String? ?? "",
      sfVip: (json['sfVip'] as num?)?.toInt(),
      realName: json['realName'] as String? ?? "",
      idcardStatus: (json['idcardStatus'] as num?)?.toInt(),
      mobilePlain: json['mobilePlain'] as String? ?? "",
      registerUrl: json['registerUrl'] as String? ?? "",
      payPasswordSetFlag: json['payPasswordSetFlag'] as bool? ?? false,
      cashBalance: (json['cashBalance'] as num?)?.toDouble(),
      idcard: json['idcard'] as String? ?? "",
      referralCode: json['referralCode'] as String? ?? "",
      email: json['email'] as String? ?? "",
      username: json['username'] as String? ?? "",
      isCmsSysn: (json['isCmsSysn'] as num?)?.toInt(),
      level: (json['level'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      usaWithdraw: json['usaWithdraw'] as bool?,
    );

Map<String, dynamic> _$UserInfoResultToJson(UserInfoResult instance) =>
    <String, dynamic>{
      'isQueryPerm': instance.isQueryPerm,
      'mobile': instance.mobile,
      'levelName': instance.levelName,
      'avatar': instance.avatar,
      'emailPlain': instance.emailPlain,
      'countryId': instance.countryId,
      'sfVip': instance.sfVip,
      'realName': instance.realName,
      'idcardStatus': instance.idcardStatus,
      'mobilePlain': instance.mobilePlain,
      'registerUrl': instance.registerUrl,
      'payPasswordSetFlag': instance.payPasswordSetFlag,
      'cashBalance': instance.cashBalance,
      'idcard': instance.idcard,
      'referralCode': instance.referralCode,
      'email': instance.email,
      'username': instance.username,
      'isCmsSysn': instance.isCmsSysn,
      'level': instance.level,
      'userId': instance.userId,
      'usaWithdraw': instance.usaWithdraw,
    };
