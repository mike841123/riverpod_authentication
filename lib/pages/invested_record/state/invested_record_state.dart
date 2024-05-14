import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../domain/response/save_coin_response/save_coin_history_response.dart';
import '../../../domain/response/save_coin_response/save_coin_rate_response.dart';

class InvestedRecordState extends Equatable {
  const InvestedRecordState({
    this.saveCoinRateResponse,
    this.status = InvestedRecordPageStatus.initial,
    this.coinTypeDropdownList = const [
      InvestedCoinTypeLabel(CoinType.usdt),
      InvestedCoinTypeLabel(CoinType.fil),
    ],
    this.coinTypeSelectedLabel,
    this.orderTypeDropdownList = const [
      InvestedOrderTypeLabel(OrderType.op1),
      InvestedOrderTypeLabel(OrderType.op2),
      InvestedOrderTypeLabel(OrderType.op3),
      InvestedOrderTypeLabel(OrderType.op4),
    ],
    this.orderTypeSelectedLabel,
    this.startDate,
    this.endDate,
    this.total = 0,
    this.currPage = 1,
    this.investedRecordList = const [],
    this.isLock = false,
  });

  final SaveCoinRateResponse? saveCoinRateResponse;
  final InvestedRecordPageStatus status;
  final List<InvestedCoinTypeLabel> coinTypeDropdownList;
  final InvestedCoinTypeLabel? coinTypeSelectedLabel;
  final List<InvestedOrderTypeLabel> orderTypeDropdownList;
  final InvestedOrderTypeLabel? orderTypeSelectedLabel;
  final TextEditingController? startDate;
  final TextEditingController? endDate;
  final int total;
  final int currPage;
  final List<SaveCoinHistory> investedRecordList;
  final bool isLock;

  InvestedRecordState copyWith({
    SaveCoinRateResponse? saveCoinRateResponse,
    InvestedRecordPageStatus? status,
    List<InvestedCoinTypeLabel>? coinTypeDropdownList,
    InvestedCoinTypeLabel? coinTypeSelectedLabel,
    List<InvestedOrderTypeLabel>? orderTypeDropdownList,
    InvestedOrderTypeLabel? orderTypeSelectedLabel,
    TextEditingController? startDate,
    TextEditingController? endDate,
    bool isClearSearch = false,
    int? total,
    int? currPage,
    List<SaveCoinHistory>? investedRecordList,
    bool? isLock,
  }) {
    return InvestedRecordState(
      saveCoinRateResponse: saveCoinRateResponse ?? this.saveCoinRateResponse,
      status: status ?? this.status,
      coinTypeDropdownList: coinTypeDropdownList ?? this.coinTypeDropdownList,
      coinTypeSelectedLabel: isClearSearch ? null : coinTypeSelectedLabel ?? this.coinTypeSelectedLabel,
      orderTypeDropdownList: orderTypeDropdownList ?? this.orderTypeDropdownList,
      orderTypeSelectedLabel: isClearSearch ? null : orderTypeSelectedLabel ?? this.orderTypeSelectedLabel,
      startDate: isClearSearch ? TextEditingController() : startDate ?? this.startDate,
      endDate: isClearSearch ? TextEditingController() : endDate ?? this.endDate,
      total: total ?? this.total,
      currPage: currPage ?? this.currPage,
      investedRecordList: investedRecordList ?? this.investedRecordList,
      isLock: isLock ?? this.isLock,
    );
  }

  @override
  List<Object> get props => [
        saveCoinRateResponse ?? SaveCoinRateResponse(),
        status,
        coinTypeDropdownList,
        coinTypeSelectedLabel!,
        orderTypeDropdownList,
        orderTypeSelectedLabel!,
        startDate ?? TextEditingController(),
        endDate ?? TextEditingController(),
        total,
        currPage,
        investedRecordList,
        isLock,
      ];
}

enum InvestedRecordPageStatus { initial, success, failure }

/// 存幣紀錄幣種下拉
@immutable
class InvestedCoinTypeLabel {
  const InvestedCoinTypeLabel(this.label);

  final CoinType label;
}

enum CoinType {
  usdt("USDT", 1),
  fil("FIL", 35);

  const CoinType(this.title, this.type);

  final String title;
  final int type;
}

/// 存幣紀錄訂單狀態下拉
@immutable
class InvestedOrderTypeLabel {
  const InvestedOrderTypeLabel(this.label);

  final OrderType label;
}

enum OrderType {
  op1("有效", 1),
  op2("已到期", 2),
  op3("已贖回", 3),
  op4("已續存", 4);

  const OrderType(this.title, this.type);

  final String title;
  final int type;
}

enum FlowPageStatus { initial, success, failure }
