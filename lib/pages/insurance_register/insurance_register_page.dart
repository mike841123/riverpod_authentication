import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll/pages/insurance_register/providers/insurance_register_providers.dart';
import 'package:infinite_scroll/util/widget_util.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../domain/response/insurance_page_response/insurance_info_response.dart';

class InsuranceRegisterPage extends ConsumerStatefulWidget {
  const InsuranceRegisterPage({super.key});

  @override
  ConsumerState<InsuranceRegisterPage> createState() => _InsuranceRegisterPageState();
}

class _InsuranceRegisterPageState extends ConsumerState<InsuranceRegisterPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(insuranceRegisterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("insurance_register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<InsuranceInfoResult>(
                isDense: true,
                items: state.insuranceCountry.map<DropdownMenuItem<InsuranceInfoResult>>((InsuranceInfoResult data) {
                  return DropdownMenuItem(
                    value: data,
                    child: Builder(builder: (context) {
                      return Text(
                        data.countryName,
                        maxLines: 1,
                      );
                    }),
                  );
                }).toList(),
                value: state.insuranceSelectedCountry,
                hint: const Text("請選擇"),
                onChanged: (InsuranceInfoResult? value) {
                  ref.read(insuranceRegisterProvider.notifier).updateSelectedCountry(value!);
                },
                isExpanded: true,
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Gap(10),
            state.insuranceQrcodeResponse?.data == null
                ? empty()
                : Row(
                    children: [
                      for (int i = 0; i < state.insuranceQrcodeResponse!.data!.length; i++)
                        Column(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              color: Colors.white,
                              child: QrImageView(
                                data: state.insuranceQrcodeResponse!.data![0].imgUrl,
                                version: QrVersions.auto,
                                size: 120,
                              ),
                            ),
                            Gap(4),
                            Text(state.insuranceQrcodeResponse!.data![0].qrKind),
                          ],
                        )
                    ],
                  ),
            Gap(10),
            state.insuranceSelectedCountry?.countryId == 86
                ? Column(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<InsuranceInfoResult>(
                          isDense: true,
                          items: state.insuranceArea.map<DropdownMenuItem<InsuranceInfoResult>>((InsuranceInfoResult data) {
                            return DropdownMenuItem(
                              value: data,
                              child: Builder(builder: (context) {
                                return Text(
                                  data.areaName ?? "",
                                  maxLines: 1,
                                );
                              }),
                            );
                          }).toList(),
                          value: state.insuranceSelectedArea,
                          hint: const Text("請選擇"),
                          onChanged: (InsuranceInfoResult? value) {
                            ref.read(insuranceRegisterProvider.notifier).updateSelectedArea(value!);
                          },
                          isExpanded: true,
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Gap(10),
                    ],
                  )
                : empty(),
            DropdownButtonHideUnderline(
              child: DropdownButton2<InsuranceInfoResult>(
                isDense: true,
                items: state.insuranceCompanyId.map<DropdownMenuItem<InsuranceInfoResult>>((InsuranceInfoResult data) {
                  return DropdownMenuItem(
                    value: data,
                    child: Builder(builder: (context) {
                      return Text(
                        data.insuranceCompanyName,
                        maxLines: 1,
                      );
                    }),
                  );
                }).toList(),
                value: state.insuranceSelectedCompany,
                hint: const Text("請選擇"),
                onChanged: (InsuranceInfoResult? value) {
                  ref.read(insuranceRegisterProvider.notifier).updateSelectedCompany(value!);
                },
                isExpanded: true,
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Gap(10),
            DropdownButtonHideUnderline(
              child: DropdownButton2<InsuranceInfoResult>(
                isDense: true,
                items: state.insuranceCategoryId.map<DropdownMenuItem<InsuranceInfoResult>>((InsuranceInfoResult data) {
                  return DropdownMenuItem(
                    value: data,
                    child: Builder(builder: (context) {
                      return Text(
                        data.insuranceCategoryName,
                        maxLines: 1,
                      );
                    }),
                  );
                }).toList(),
                value: state.insuranceSelectedCategory,
                hint: const Text("請選擇"),
                onChanged: (InsuranceInfoResult? value) {
                  ref.read(insuranceRegisterProvider.notifier).updateSelectedCategory(value!);
                },
                isExpanded: true,
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Gap(10),
            DropdownButtonHideUnderline(
              child: DropdownButton2<InsuranceInfoResult>(
                isDense: true,
                items: state.insuranceType.map<DropdownMenuItem<InsuranceInfoResult>>((InsuranceInfoResult data) {
                  return DropdownMenuItem(
                    value: data,
                    child: Builder(builder: (context) {
                      return Text(
                        data.insuranceTypeName,
                        maxLines: 1,
                      );
                    }),
                  );
                }).toList(),
                value: state.insuranceSelectedType,
                hint: const Text("請選擇"),
                onChanged: (InsuranceInfoResult? value) {
                  ref.read(insuranceRegisterProvider.notifier).updateSelectedType(value!);
                },
                isExpanded: true,
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Gap(10),
            Text("上傳保單"),
            Gap(4),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (int i = 0; i < state.policyImage.length; i++)
                      Stack(
                        children: [
                          CachedNetworkImage(
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            imageUrl: state.policyImage[i].imgUrl,
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                ref.read(insuranceRegisterProvider.notifier).removeInsurance(i);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                        ),
                                        color: Colors.black.withOpacity(0.5)),
                                    width: 24,
                                    height: 24,
                                  ),
                                  const Positioned(
                                    right: 0,
                                    child: Icon(
                                      Icons.close_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    InkWell(
                      onTap: () {
                        ref.read(insuranceRegisterProvider.notifier).uploadInsurance();
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.black26,
                        child: Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
