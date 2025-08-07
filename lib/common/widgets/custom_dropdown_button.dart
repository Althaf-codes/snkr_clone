import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

Widget customDropDownButton(BuildContext context,
    {required List<String> allSort,
    required String label,
    required Function(String? value) onChange}) {
  return DropdownButtonFormField<String>(
      menuMaxHeight: MediaQuery.of(context).size.height * 0.8,
      focusColor: AppConstants.whiteColor,
      alignment: Alignment.centerLeft,
      dropdownColor: AppConstants.whiteColor,
      decoration: InputDecoration(
          fillColor: AppConstants.whiteColor,
          focusColor: AppConstants.whiteColor,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppConstants.blackColor),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppConstants.blackColor),
              borderRadius: BorderRadius.circular(12)),
          // hintText: "Sort by",
          labelText: label,
          labelStyle: AppConstants.h1Normal
          // helperText: "Sort by"
          ),
      // value: _allSort[0],

      items: [
        ...allSort.asMap().entries.map((entry) => DropdownMenuItem<String>(
            value: entry.key.toString(), child: Text(entry.value))),
        // ...allSort.map(
        // (ele) => DropdownMenuItem<String>(value: ele, child: Text(ele)))
        // asMap(
        // () => DropdownMenuItem<String>(value: ele, child: Text(ele)))
      ],
      onChanged: onChange);
}
