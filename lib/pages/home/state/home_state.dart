import 'package:equatable/equatable.dart';

import '../../../domain/response/home_page_response/banner_list_response.dart';

class HomeState extends Equatable {
  const HomeState({
    this.bannerList = const [],
  });

  final List<BannerItem> bannerList;

  HomeState copyWith({
    List<BannerItem>? bannerList,
  }) {
    return HomeState(
      bannerList: bannerList ?? this.bannerList,
    );
  }

  @override
  List<Object> get props => [bannerList];
}
