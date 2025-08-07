// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snkr_app/common/widgets/custom_container.dart';
import 'package:snkr_app/model/sub_menu_model.dart';
import 'package:snkr_app/screens/shop/components/sub_menu_list.dart';

import 'package:snkr_app/utils/contants.dart';

class SubMenuScreen extends StatelessWidget {
  final String title;
  final List<SubMenuModel> submenu;
  const SubMenuScreen({
    super.key,
    required this.title,
    required this.submenu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.whiteColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppConstants.blackColor,
            )),
        title: Text(
          title,
          style: AppConstants.h1Bold.copyWith(
              fontSize: 16, letterSpacing: 1, wordSpacing: 0.5, height: 0.3),
        ),
      ),
      body: customContainer(context,
          child: SingleChildScrollView(
              child: Column(
            children: [
              ...submenu.map(
                (ele) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: subMenuList(context, submenu: ele, menuTitle: title),
                ),
              )
            ],
          ))),
    );
  }
}
