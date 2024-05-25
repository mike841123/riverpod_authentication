import 'package:equatable/equatable.dart';
import 'package:infinite_scroll/domain/response/public_response/upload_image_response.dart';
import '../../../domain/response/insurance_page_response/exchange_rate_response.dart';
import '../../../domain/response/insurance_page_response/insurance_info_response.dart';
import '../../../domain/response/insurance_page_response/insurance_qrcode_response.dart';

class InsuranceRegisterState extends Equatable {
  const InsuranceRegisterState({
    this.exchangeRateResponse,
    this.insuranceInfoList = const [],
    this.insuranceCountry = const [],
    this.insuranceSelectedCountry,
    this.insuranceArea = const [],
    this.insuranceSelectedArea,
    this.insuranceCompanyId = const [],
    this.insuranceSelectedCompany,
    this.insuranceCategoryId = const [],
    this.insuranceSelectedCategory,
    this.insuranceType = const [],
    this.insuranceSelectedType,
    this.insuranceQrcodeResponse,
    this.policyImage = const [],
  });

  final List<InsuranceInfoResult> insuranceInfoList;
  final ExchangeRateResponse? exchangeRateResponse;

  final List<InsuranceInfoResult> insuranceCountry;
  final InsuranceInfoResult? insuranceSelectedCountry;

  final List<InsuranceInfoResult> insuranceArea;
  final InsuranceInfoResult? insuranceSelectedArea;

  final List<InsuranceInfoResult> insuranceCompanyId;
  final InsuranceInfoResult? insuranceSelectedCompany;

  final List<InsuranceInfoResult> insuranceCategoryId;
  final InsuranceInfoResult? insuranceSelectedCategory;

  final List<InsuranceInfoResult> insuranceType;
  final InsuranceInfoResult? insuranceSelectedType;

  final InsuranceQrcodeResponse? insuranceQrcodeResponse;
  final List<UploadImageResult> policyImage;

  InsuranceRegisterState copyWith({
    List<InsuranceInfoResult>? insuranceInfoList,
    ExchangeRateResponse? exchangeRateResponse,
    List<InsuranceInfoResult>? insuranceCountry,
    InsuranceInfoResult? insuranceSelectedCountry,
    List<InsuranceInfoResult>? insuranceArea,
    InsuranceInfoResult? insuranceSelectedArea,
    List<InsuranceInfoResult>? insuranceCompanyId,
    InsuranceInfoResult? insuranceSelectedCompany,
    List<InsuranceInfoResult>? insuranceCategoryId,
    InsuranceInfoResult? insuranceSelectedCategory,
    List<InsuranceInfoResult>? insuranceType,
    InsuranceInfoResult? insuranceSelectedType,
    InsuranceQrcodeResponse? insuranceQrcodeResponse,
    List<UploadImageResult>? policyImage,
    bool isClearArea = false,
    bool isClearCompany = false,
    bool isClearCategory = false,
    bool isClearType = false,
  }) {
    return InsuranceRegisterState(
      insuranceInfoList: insuranceInfoList ?? this.insuranceInfoList,
      exchangeRateResponse: exchangeRateResponse ?? this.exchangeRateResponse,
      insuranceCountry: insuranceCountry ?? this.insuranceCountry,
      insuranceSelectedCountry: insuranceSelectedCountry ?? this.insuranceSelectedCountry,
      insuranceArea: insuranceArea ?? this.insuranceArea,
      insuranceSelectedArea: isClearArea ? null : insuranceSelectedArea ?? this.insuranceSelectedArea,
      insuranceCompanyId: insuranceCompanyId ?? this.insuranceCompanyId,
      insuranceSelectedCompany: isClearCompany ? null : insuranceSelectedCompany ?? this.insuranceSelectedCompany,
      insuranceCategoryId: insuranceCategoryId ?? this.insuranceCategoryId,
      insuranceSelectedCategory: isClearCategory ? null : insuranceSelectedCategory ?? this.insuranceSelectedCategory,
      insuranceType: insuranceType ?? this.insuranceType,
      insuranceSelectedType: isClearType ? null : insuranceSelectedType ?? this.insuranceSelectedType,
      insuranceQrcodeResponse: insuranceQrcodeResponse ?? this.insuranceQrcodeResponse,
      policyImage: policyImage ?? this.policyImage,
    );
  }

  @override
  List<Object> get props => [
        insuranceInfoList,
        exchangeRateResponse ?? ExchangeRateResponse(),
        insuranceCountry,
        insuranceSelectedCountry ?? InsuranceInfoResult(),
        insuranceCountry,
        insuranceSelectedArea ?? InsuranceInfoResult(),
        insuranceCompanyId,
        insuranceSelectedCompany ?? InsuranceInfoResult(),
        insuranceCategoryId,
        insuranceSelectedCategory ?? InsuranceInfoResult(),
        insuranceType,
        insuranceSelectedType ?? InsuranceInfoResult(),
        insuranceQrcodeResponse ?? InsuranceQrcodeResponse(),
        policyImage,
      ];
}
