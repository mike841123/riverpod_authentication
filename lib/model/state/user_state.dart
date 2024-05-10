import 'package:equatable/equatable.dart';
import 'package:infinite_scroll/domain/response/public_response/user_info_response.dart';
import '../../domain/response/public_response/digital_bank_response.dart';

class UserState extends Equatable {
  const UserState({
    this.userInfoResult,
    this.digitalBankResult,
  });

  final UserInfoResult? userInfoResult;
  final DigitalBankResult? digitalBankResult;

  UserState copyWith({
    UserInfoResult? userInfoResult,
    DigitalBankResult? digitalBankResult,
  }) {
    return UserState(
      userInfoResult: userInfoResult ?? this.userInfoResult,
      digitalBankResult: digitalBankResult ?? this.digitalBankResult,
    );
  }

  @override
  List<Object> get props => [
        userInfoResult ?? UserInfoResult(),
        digitalBankResult ?? DigitalBankResult(),
      ];
}
