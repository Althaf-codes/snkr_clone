import 'package:flutter/material.dart';
import 'package:snkr_app/common/screens/categorywise_product_screen.dart';
import 'package:snkr_app/common/widgets/custom_container.dart';
import 'package:snkr_app/screens/shop/components/sub_menu_list_tile.dart';
import 'package:snkr_app/utils/contants.dart';

class AllBrandScreen extends StatelessWidget {
  final List<String> items;

  const AllBrandScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    // Sort the items alphabetically
    items.sort();
    // Group items by their starting letter
    Map<String, List<String>> groupedItems = {};
    for (var item in items) {
      String startingLetter = item[0].toUpperCase();
      if (groupedItems.containsKey(startingLetter)) {
        groupedItems[startingLetter]!.add(item);
      } else {
        groupedItems[startingLetter] = [item];
      }
    }

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
          "All Brands",
          style: AppConstants.h1Bold.copyWith(
              color: AppConstants.grayColor, fontSize: 22, letterSpacing: 1),
        ),
      ),
      body: customContainer(
        context,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.75,
              padding: const EdgeInsets.only(top: 4, left: 8),
              decoration: const BoxDecoration(
                  color: AppConstants.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: TextField(
                // showCursor: true,
                style: const TextStyle(
                  color: AppConstants.blackColor,
                ),
                onTap: () {
                  // setState(() {
                  //   isTapped = true;
                  // });
                },
                onChanged: (val) {
                  // if (_textEditingController.value.text.isNotEmpty) {
                  //   setState(() {
                  //     isTyped = true;
                  //   });
                  // } else {
                  //   setState(() {
                  //     isTyped = false;
                  //   });
                  // }
                },
                textAlign: TextAlign.justify,
                textAlignVertical: TextAlignVertical.top,
                controller: TextEditingController(),
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppConstants.blackColor)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppConstants.blackColor)),
                    contentPadding: const EdgeInsets.all(10),
                    focusColor: Colors.transparent,
                    alignLabelWithHint: true,
                    hintText: 'Search Brand Here...',
                    hintStyle: AppConstants.h1Normal.copyWith(letterSpacing: 1),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Icon(
                        Icons.search_outlined,
                        size: 26,
                        color: AppConstants.lightBlackColor,
                      ),
                    )),
              ),
            ),
          ),
          ...groupedItems.entries.map((entry) {
            String letter = entry.key;
            List<String> items = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  color: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    letter,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // ListTiles for each item starting with that letter
                ...items.map((item) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CategorywiseProductsScreen(title: item)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12),
                      child: subMenuListTile(label: item),
                    )))
              ],
            );
          }).toList(),
        ]),
      ),
    );
  }
}
