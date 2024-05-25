import 'package:equatable/equatable.dart';

import '../../../domain/response/insurance_page_response/insurance_order_response.dart';

class InsuranceManagementState extends Equatable {
  const InsuranceManagementState({
    this.status = InsuranceManagementPageStatus.initial,
    this.currPage = 1,
    this.isLoadMore = false,
    this.insuranceOrderList = const [],
    this.insuranceOrderResponse,
  });

  final InsuranceManagementPageStatus status;
  final int currPage;
  final bool isLoadMore;
  final List<InfoPageItem> insuranceOrderList;
  final InsuranceOrderResponse? insuranceOrderResponse;

  InsuranceManagementState copyWith({
    InsuranceManagementPageStatus? status,
    int? currPage,
    bool? isLoadMore,
    List<InfoPageItem>? insuranceOrderList,
    InsuranceOrderResponse? insuranceOrderResponse,
  }) {
    return InsuranceManagementState(
      status: status ?? this.status,
      currPage: currPage ?? this.currPage,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      insuranceOrderList: insuranceOrderList ?? this.insuranceOrderList,
      insuranceOrderResponse: insuranceOrderResponse ?? this.insuranceOrderResponse,
    );
  }

  @override
  List<Object> get props => [
        status,
        currPage,
        isLoadMore,
        insuranceOrderList,
        insuranceOrderResponse ?? InsuranceOrderResponse(),
      ];
}

enum InsuranceManagementPageStatus { initial, success, failure }
