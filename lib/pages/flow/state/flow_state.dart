import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/response/flow_page_response/asset_info_list_response.dart';

class FlowState extends Equatable {
  const FlowState({
    this.fundsTransferSelectLabel,
    this.fundsTransferList = const [
      FundsTransferLabel(FundsTransferType.performanceAllowance),
      FundsTransferLabel(FundsTransferType.insuranceCoupon),
    ],
    this.total = 0,
    this.assetInfo = const [],
    this.currPage = 1,
    this.status = FlowPageStatus.initial,
  });

  final List<AssetInfo> assetInfo;
  final FundsTransferLabel? fundsTransferSelectLabel;
  final List<FundsTransferLabel> fundsTransferList;
  final int total;
  final int currPage;
  final FlowPageStatus status;

  FlowState copyWith({
    List<AssetInfo>? assetInfo,
    FundsTransferLabel? fundsTransferSelectLabel,
    List<FundsTransferLabel>? fundsTransferList,
    int? total,
    int? currPage,
    FlowPageStatus? status,
  }) {
    return FlowState(
      assetInfo: assetInfo ?? this.assetInfo,
      fundsTransferSelectLabel: fundsTransferSelectLabel ?? this.fundsTransferSelectLabel,
      fundsTransferList: fundsTransferList ?? this.fundsTransferList,
      total: total ?? this.total,
      currPage: currPage ?? this.currPage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        assetInfo,
        fundsTransferSelectLabel ?? const FundsTransferLabel(FundsTransferType.performanceAllowance),
        fundsTransferList,
        total,
        currPage,
        status,
      ];
}

/// 資金划轉下拉
@immutable
class FundsTransferLabel {
  const FundsTransferLabel(this.label);

  final FundsTransferType label;
}

enum FundsTransferType {
  performanceAllowance("績效津貼", 7),
  insuranceCoupon("保險券", 6);

  const FundsTransferType(this.title, this.type);

  final String title;
  final int type;
}

enum FlowPageStatus { initial, success, failure }
