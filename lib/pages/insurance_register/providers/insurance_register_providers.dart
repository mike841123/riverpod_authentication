import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/domain/response/insurance_page_response/insurance_info_response.dart';
import 'package:infinite_scroll/domain/response/insurance_page_response/insurance_qrcode_response.dart';
import 'package:infinite_scroll/domain/response/public_response/upload_image_response.dart';
import 'package:infinite_scroll/model/providers/user_providers.dart';
import 'package:infinite_scroll/pages/insurance_register/repository/insurance_register_repository_impl.dart';
import '../state/insurance_register_state.dart';

final insuranceRegisterProvider = StateNotifierProvider.autoDispose<InsuranceRegisterNotifier, InsuranceRegisterState>((ref) {
  return InsuranceRegisterNotifier(ref);
});

class InsuranceRegisterNotifier extends StateNotifier<InsuranceRegisterState> {
  InsuranceRegisterNotifier(this.ref) : super(const InsuranceRegisterState()) {
    getInsuranceInfo();
  }

  final Ref ref;

  Future<void> getCustomerQrCode(int countryId) async {
    final repository = ref.read(insuranceRegisterRepositoryProvider);
    InsuranceQrcodeResponse response = await repository.getCustomerQrCode(countryId);
    state = state.copyWith(insuranceQrcodeResponse: response);
  }

  Future<void> getInsuranceInfo() async {
    final repository = ref.read(insuranceRegisterRepositoryProvider);
    InsuranceInfoResponse response = await repository.getInsuranceInfo();
    List<InsuranceInfoResult> list = response.data ?? [];
    state = state.copyWith(insuranceInfoList: list);
    Set<int> seenIds = {};
    List<InsuranceInfoResult> uniqueInsuranceResults = list.where((result) {
      return seenIds.add(result.countryId);
    }).toList(); // 去重
    state = state.copyWith(insuranceCountry: uniqueInsuranceResults);
    updateSelectedCountry(uniqueInsuranceResults.first); // 預設選第一個
  }

  void updateSelectedCountry(InsuranceInfoResult value) {
    getCustomerQrCode(value.countryId);
    List<InsuranceInfoResult> list = state.insuranceInfoList.where((element) => value.countryId == element.countryId).toList();
    List<InsuranceInfoResult> uniqueInsuranceResults = [];
    if (value.countryId == 86) {
      uniqueInsuranceResults = removeDuplicates(list, (result) => result.areaId ?? 0);
      state = state.copyWith(
        isClearArea: true,
        isClearCompany: true,
        isClearCategory: true,
        isClearType: true,
        insuranceSelectedCountry: value,
        insuranceArea: uniqueInsuranceResults,
      );
    } else {
      uniqueInsuranceResults = removeDuplicates(list, (result) => result.insuranceCompanyId);
      state = state.copyWith(
        isClearCompany: true,
        isClearCategory: true,
        isClearType: true,
        insuranceCompanyId: uniqueInsuranceResults,
        insuranceSelectedCountry: value,
      );
    }
  }

  void updateSelectedArea(InsuranceInfoResult value) {
    List<InsuranceInfoResult> list =
        state.insuranceInfoList.where((element) => value.areaId == element.areaId && value.countryId == element.countryId).toList();
    List<InsuranceInfoResult> uniqueInsuranceResults = removeDuplicates(list, (result) => result.insuranceCompanyId);
    state = state.copyWith(
      isClearCompany: true,
      isClearCategory: true,
      isClearType: true,
      insuranceSelectedArea: value,
      insuranceCompanyId: uniqueInsuranceResults,
    );
  }

  void updateSelectedCompany(InsuranceInfoResult value) {
    List<InsuranceInfoResult> list = state.insuranceInfoList
        .where((element) => value.areaId == element.areaId && value.countryId == element.countryId && value.insuranceCompanyId == element.insuranceCompanyId)
        .toList();
    List<InsuranceInfoResult> uniqueInsuranceResults = removeDuplicates(list, (result) => result.insuranceCategoryId);
    state = state.copyWith(
      isClearCategory: true,
      isClearType: true,
      insuranceSelectedCompany: value,
      insuranceCategoryId: uniqueInsuranceResults,
    );
  }

  void updateSelectedCategory(InsuranceInfoResult value) {
    List<InsuranceInfoResult> list = state.insuranceInfoList
        .where((element) =>
            value.areaId == element.areaId &&
            value.countryId == element.countryId &&
            value.insuranceCompanyId == element.insuranceCompanyId &&
            value.insuranceCategoryId == element.insuranceCategoryId)
        .toList();
    state = state.copyWith(
      isClearType: true,
      insuranceSelectedCategory: value,
      insuranceType: list,
    );
  }

  void updateSelectedType(InsuranceInfoResult value) {
    state = state.copyWith(
      insuranceSelectedType: value,
    );
  }

  /// 依條件不同去重
  List<InsuranceInfoResult> removeDuplicates(List<InsuranceInfoResult> list, int Function(InsuranceInfoResult) keySelector) {
    Set<int> seenIds = {};
    return list.where((result) {
      return seenIds.add(keySelector(result));
    }).toList();
  }

  Future<void> uploadInsurance() async {
    List<UploadImageResult> list = await ref.read(userProvider.notifier).uploadImageS3("Insurance", isMulti: true);
    state = state.copyWith(
      policyImage: state.policyImage.isNotEmpty ? List.of(state.policyImage..addAll(list)) : list,
    );
  }

  void removeInsurance(int index ) {
    List<UploadImageResult> list = state.policyImage;
    list.removeAt(index);
    state = state.copyWith(
      policyImage: list,
    );
  }
}
