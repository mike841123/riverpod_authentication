// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../domain/response/insurance_page_response/insurance_info_response.dart';
//
// class InsuranceDropdown extends StatelessWidget {
//   const InsuranceDropdown({super.key, required this.dropdownList, required this.selected, this.onChanged});
//
//   final List<InsuranceInfoResult> dropdownList;
//   final InsuranceInfoResult selected;
//   final Function(InsuranceInfoResult? value)? onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<InsuranceInfoResult>(
//         isDense: true,
//         items: dropdownList.map<DropdownMenuItem<InsuranceInfoResult>>((InsuranceInfoResult data) {
//           return DropdownMenuItem(
//             value: data,
//             child: Builder(builder: (context) {
//               return Text(
//                 data.countryName,
//                 maxLines: 1,
//               );
//             }),
//           );
//         }).toList(),
//         value: selected,
//         hint: const Text("請選擇"),
//         onChanged: (InsuranceInfoResult? value) {
//           onChanged?.call(value);
//           // ref.read(insuranceRegisterProvider.notifier).updateSelectedCountry(value!);
//         },
//         isExpanded: true,
//         dropdownStyleData: DropdownStyleData(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(14),
//           ),
//         ),
//         menuItemStyleData: const MenuItemStyleData(
//           height: 40,
//           padding: EdgeInsets.only(left: 14, right: 14),
//         ),
//         buttonStyleData: ButtonStyleData(
//           height: 50,
//           padding: const EdgeInsets.only(left: 14, right: 14),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(14),
//             border: Border.all(
//               color: Colors.black26,
//             ),
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
