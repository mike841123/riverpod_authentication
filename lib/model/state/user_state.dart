import 'package:equatable/equatable.dart';
import 'package:infinite_scroll/domain/response/public_response/user_info_response.dart';

import '../../../domain/response/home_page_response/banner_list_response.dart';

class UserState extends Equatable {
  const UserState({
    this.userInfoResult,
  });

  final UserInfoResult? userInfoResult;

  UserState copyWith({
    UserInfoResult? userInfoResult,
  }) {
    return UserState(
      userInfoResult: userInfoResult ?? this.userInfoResult,
    );
  }

  @override
  List<Object> get props => [userInfoResult ?? UserInfoResult()];
}
