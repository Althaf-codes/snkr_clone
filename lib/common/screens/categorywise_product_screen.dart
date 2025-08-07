import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/common/widgets/border_button.dart';
import 'package:snkr_app/common/widgets/custom_container.dart';
import 'package:snkr_app/common/widgets/custom_dropdown_button.dart';
import 'package:snkr_app/common/widgets/prefix_icon_button.dart';
import 'package:snkr_app/common/widgets/product_grid_section.dart';
import 'package:snkr_app/model/product_model.dart';
import 'package:snkr_app/provider/product_provider.dart';
import 'package:snkr_app/utils/contants.dart';

enum SortOption { highToLow, lowToHigh, newArrival, onSale, featured }

class CategorywiseProductsScreen extends StatefulWidget {
  final String title;
  final bool showBrands;
  final bool showDepartment;
  final bool showAll;

  final String departmentName;

  const CategorywiseProductsScreen({
    Key? key,
    required this.title,
    this.showBrands = true,
    this.showDepartment = true,
    this.showAll = false,
    this.departmentName = "",
  }) : super(key: key);

  @override
  State<CategorywiseProductsScreen> createState() =>
      _CategorywiseProductsScreenState();
}

class _CategorywiseProductsScreenState
    extends State<CategorywiseProductsScreen> {
  late ScrollController _scrollController;
  int _currentIndex = 0;
  late List<bool> sortChecks;
  bool isHighToLowSelected = false;
  bool isLowToHighSelected = false;
  bool isNewArrivalSelected = false;
  bool isOnSaleSelected = false;
  bool isFeaturedSelected = false;

  double sliderStart = 0.0;
  double sliderEnd = 200.0;

  int? selectedMin;
  int? selectedMax;

  SortOption? _selectedOption;
  final List<String> _allSort = [
    "New Arrivals",
    "Price (Low to High)",
    "Price (High to Low)",
    "Featured",
    "Best Seller",
  ];

  final List<String> _allGender = ["Men", "Kids", "Women", "Unisex"];

  final List<String> _allBrands = [
    "Adidas",
    "Asics",
    "Carhartt WIP",
    "Carrots",
    "Chinatown Market",
    "Crocs",
    "Crep Protect",
    "Huf",
    "Jason Markks",
    "Jordan",
    "Les Benjamins",
    "Market",
    "Nike",
    "New Era",
    "New Balance",
    "On Running",
    "Ortho Movement",
    "Patagonia",
    "Puma",
    "Salomon",
    "Saucony",
    "Stussy",
    "Stanley",
    "Veja",
  ];

  final List<String> _allDepartment = ["Accessories", "Apparel", "Footwear"];

  final List<String> _allClothingSizes = ["XS", "S", "M", "L", "XL", "2XL"];

  final List<String> _allFootwearSizes = [
    '34',
    '35',
    '35.5',
    '36',
    '36.5',
    '36.7',
    '37',
    '37.3',
    '37.5',
    '38',
    '38.5',
    '38.7',
    '39',
    '34',
    '35',
    '35.5',
    '36',
    '36.5',
    '36.7',
    '37',
    '37.3',
    '37.5',
    '38',
    '38.5',
    '38.7',
    '39',
  ];

  List<Product> _categoryProducts = [];
  @override
  void initState() {
    _scrollController = ScrollController();
    sortChecks = List<bool>.generate(4, (i) => false);
    _categoryProducts =
        Provider.of<ProductProvider>(context, listen: false).categoryProducts;
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<CategoryProductProvider>(context, listen: false).init();
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void onSortOrderChanged(
      {required bool isHighToLow,
      required bool isLowToHigh,
      required bool isOnSale,
      required bool isNewArrival,
      required bool isFeatured}) {
    // setState(() {
    if (isHighToLow) {
      isHighToLowSelected = true;
      isLowToHighSelected = false;
      isFeaturedSelected = false;
      isNewArrivalSelected = false;
      isOnSaleSelected = false;

      _selectedOption = SortOption.highToLow;
    } else if (isLowToHigh) {
      isLowToHighSelected = true;
      isHighToLowSelected = false;
      isFeaturedSelected = false;
      isNewArrivalSelected = false;
      isOnSaleSelected = false;

      _selectedOption = SortOption.lowToHigh;
    } else if (isNewArrival) {
      isNewArrivalSelected = true;
      isHighToLowSelected = false;
      isLowToHighSelected = false;
      isFeaturedSelected = false;
      isOnSaleSelected = false;

      _selectedOption = SortOption.newArrival;
    } else if (isOnSale) {
      isOnSaleSelected = true;
      isHighToLowSelected = false;
      isLowToHighSelected = false;
      isFeaturedSelected = false;
      isNewArrivalSelected = false;

      _selectedOption = SortOption.onSale;
    } else if (isFeatured) {
      isFeaturedSelected = true;
      isHighToLowSelected = false;
      isLowToHighSelected = false;
      isNewArrivalSelected = false;
      isOnSaleSelected = false;

      _selectedOption = SortOption.featured;
    }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // print("The checkboxes are $sortChecks");

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        // shape: const LinearBorder(),
        backgroundColor: AppConstants.whiteColor,
        surfaceTintColor: AppConstants.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppConstants.blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.title,
          style: AppConstants.h1Bold.copyWith(
              fontSize: 22,
              color: AppConstants.secondaryColor,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      floatingActionButton: InkWell(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: AppConstants.whiteColor,
              isScrollControlled: true,
              context: context,
              builder: (context) => StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return FractionallySizedBox(
                      heightFactor: 0.6,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              child: Column(
                                children: [
                                  AppConstants.height10,
                                  const Divider(
                                    height: 4,
                                    thickness: 4,
                                    indent: 190,
                                    endIndent: 190,
                                    color: AppConstants.grayColor,
                                  ),
                                  AppConstants.height5,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Spacer(),
                                      AppConstants.width20,
                                      // AppConstants.width20,
                                      Text(
                                        "Sort & Filter Products",
                                        style: AppConstants.h1Normal.copyWith(
                                            fontSize: 20,
                                            color: AppConstants.secondaryColor,
                                            letterSpacing: 1),
                                      ),
                                      const Spacer(),
                                      // AppConstants.width20,
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: AppConstants.blackColor,
                                            size: 24,
                                          )),
                                      AppConstants.width5
                                    ],
                                  ),
                                  AppConstants.height20,
                                  Divider(
                                    height: 1,
                                    thickness: 2,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              ),
                            ),
                            AppConstants.height10,
                            Expanded(
                              child: SizedBox(
                                // color: Colors.blue,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(children: [
                                      customDropDownButton(context,
                                          allSort: _allSort,
                                          label: "Sort by",
                                          // alignment: Alignment.bottomRight,
                                          onChange: (val) {}),
                                      AppConstants.height10,
                                      customDropDownButton(context,
                                          allSort: _allGender,
                                          label: "Gender",
                                          // alignment: Alignment.bottomRight,
                                          onChange: (val) {}),
                                      widget.showBrands
                                          ? AppConstants.height10
                                          : const SizedBox.shrink(),
                                      widget.showBrands
                                          ? customDropDownButton(context,
                                              allSort: _allBrands,
                                              label: "Brands:",
                                              // alignment: Alignment.bottomRight,
                                              onChange: (val) {})
                                          : const SizedBox.shrink(),
                                      widget.showDepartment
                                          ? AppConstants.height10
                                          : const SizedBox.shrink(),
                                      widget.showDepartment
                                          ? customDropDownButton(context,
                                              allSort: _allDepartment,
                                              label: "Department",
                                              // alignment: Alignment.bottomRight,
                                              onChange: (val) {})
                                          : const SizedBox.shrink(),
                                      widget.showAll
                                          ? AppConstants.height10
                                          : !widget.showDepartment &&
                                                  widget.departmentName ==
                                                      "Apparel"
                                              ? AppConstants.height10
                                              : const SizedBox.shrink(),
                                      widget.showAll
                                          ? customDropDownButton(context,
                                              allSort: _allClothingSizes,
                                              label: "Clothing Sizes",
                                              // alignment: Alignment.bottomRight,
                                              onChange: (val) {})
                                          : !widget.showDepartment &&
                                                  widget.departmentName ==
                                                      "Apparel"
                                              ? customDropDownButton(context,
                                                  allSort: _allClothingSizes,
                                                  label: "Clothing Sizes",
                                                  // alignment:
                                                  //     Alignment.bottomRight,
                                                  onChange: (val) {})
                                              : const SizedBox.shrink(),
                                      widget.showAll ||
                                              !widget.showDepartment &&
                                                  widget.departmentName ==
                                                      "Footwear"
                                          ? AppConstants.height10
                                          : const SizedBox.shrink(),
                                      widget.showAll ||
                                              !widget.showDepartment &&
                                                  widget.departmentName ==
                                                      "Footwear"
                                          ? customDropDownButton(context,
                                              allSort: _allFootwearSizes,
                                              label: "Footwear Sizes",
                                              // alignment: Alignment.bottomRight,
                                              onChange: (val) {})
                                          : const SizedBox.shrink(),
                                      AppConstants.height10,
                                      Container(
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.95,
                                        child: InputDecorator(
                                          decoration: const InputDecoration(
                                              labelText: "Price Range",
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: AppConstants
                                                          .blackColor))),
                                          child: Column(
                                            children: [
                                              RangeSlider(
                                                inactiveColor:
                                                    AppConstants.grayColor,
                                                activeColor:
                                                    AppConstants.blackColor,
                                                values: RangeValues(
                                                    sliderStart, sliderEnd),
                                                labels: RangeLabels(
                                                    sliderStart.toString(),
                                                    sliderEnd.toString()),
                                                onChanged: (value) {
                                                  setState(() {
                                                    sliderStart = value.start;
                                                    sliderEnd = value.end;

                                                    selectedMin =
                                                        sliderStart.toInt();
                                                    selectedMax =
                                                        sliderEnd.toInt();
                                                  });
                                                },
                                                min: 0,
                                                max: 200,
                                              ),
                                              // AppConstants.height5,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15.0),
                                                    child: Text(
                                                      "0",
                                                      style: AppConstants
                                                          .h1Normal
                                                          .copyWith(
                                                              color: AppConstants
                                                                  .secondaryColor),
                                                    ),
                                                  ),
                                                  Text(
                                                    "${selectedMin ?? 0} - ${selectedMax ?? 200}",
                                                    style: AppConstants.h1Normal
                                                        .copyWith(
                                                            color: AppConstants
                                                                .secondaryColor),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Text(
                                                      "200",
                                                      style: AppConstants
                                                          .h1Normal
                                                          .copyWith(
                                                              color: AppConstants
                                                                  .secondaryColor),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      AppConstants.height10,
                                      SizedBox(
                                        // height: 70,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              prefixIconButton(
                                                height: 50,
                                                width: 100,
                                                context,
                                                title: "Apply Now",
                                                ontap: () {},
                                                hasIcon: false,
                                                bgColor:
                                                    AppConstants.blackColor,
                                                titleStyle: AppConstants
                                                    .h1Normal
                                                    .copyWith(
                                                        color: AppConstants
                                                            .whiteColor,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 18),
                                              ),
                                              AppConstants.width20,

                                              borderButton(
                                                  height: 50,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.45,
                                                  label: "Clear All Filters",
                                                  hasIcon: false,
                                                  ontap: () {}),
                                              // ;
                                              // })
                                            ],
                                          ),
                                        ),
                                      ),
                                      AppConstants.height20,
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
        },
        child: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppConstants.blackColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.filter_alt_outlined,
            size: 20,
            color: AppConstants.whiteColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: customContainer(
        context,
        color: AppConstants.lightGrayColor,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ProductGridSection(
                products: _categoryProducts,
              ),

              // widget.hasTab
              //     ? Consumer<CategoryProductProvider>(
              //         builder: (context, value, child) {
              //         if (value.filteredSubCategories.isEmpty) {
              //           return const SizedBox.shrink();
              //         }
              //         return Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: _buildTabBar(
              //               subcategories: value.filteredSubCategories),
              //         );
              //       })
              //     : const SizedBox.shrink(),

              // Container(
              //   height: 50,
              //   color: const Color.fromARGB(255, 180, 245, 213),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       filterButton(
              //           icondata: Icons.filter_alt_outlined,
              //           title: "Filter By",
              //           ontap: () {
              //             context.push("/filter");
              //             // Navigator.push(
              //             //     context,
              //             //     MaterialPageRoute(
              //             //         builder: (context) => const FilterScreen()));
              //           }),
              //       const VerticalDivider(
              //         color: Colors.grey,
              //         thickness: 1,
              //         indent: 10,
              //         endIndent: 10,
              //       ),
              //       filterButton(
              //           icondata: Icons.sort_outlined,
              //           title: "Sort By",
              //           ontap: () {

              //     showModalBottomSheet(
              //                 backgroundColor: AppConstants.whiteColor,
              //                 isScrollControlled: true,
              //                 context: context,
              //                 builder: (context) => StatefulBuilder(builder:
              //                         (BuildContext context,
              //                             StateSetter setState) {
              //                       return FractionallySizedBox(
              //                         heightFactor: 0.6,
              //                         child: SizedBox(
              //                           width: MediaQuery.of(context).size.width,
              //                           child: Column(
              //                             children: [
              //                               const SizedBox(height: 15),
              //                               const Center(
              //                                 child: Text(
              //                                   "Sort",
              //                                   style: AppConstants.h1Bold,
              //                                 ),
              //                               ),
              //                               Align(
              //                                 alignment: Alignment.centerRight,
              //                                 child: Padding(
              //                                   padding:
              //                                       const EdgeInsets.symmetric(
              //                                           horizontal: 18,
              //                                           vertical: 8),
              //                                   child: IconButton(
              //                                       onPressed: () {
              //                                         Navigator.pop(context);
              //                                       },
              //                                       icon: const Icon(
              //                                         Icons.close,
              //                                         color:
              //                                             AppConstants.blackColor,
              //                                         size: 24,
              //                                       )),
              //                                 ),
              //                               ),
              //                               const SizedBox(height: 5),
              //                               Divider(
              //                                 height: 1,
              //                                 thickness: 2,
              //                                 color: Colors.grey[300],
              //                               ),
              //                               Expanded(
              //                                 child: SizedBox(
              //                                   // color: Colors.blue,
              //                                   height: MediaQuery.of(context)
              //                                           .size
              //                                           .height *
              //                                       0.5,
              //                                   child: SingleChildScrollView(
              //                                     child: Column(
              //                                       children: [
              //                                         sortSelectionWidget(
              //                                             title: "New Arrivals",
              //                                             onChanged:
              //                                                 (bool? isSelected) {
              //                                               if (isSelected ??
              //                                                   false) {
              //                                                 setState(() {
              //                                                   onSortOrderChanged(
              //                                                       isHighToLow:
              //                                                           false,
              //                                                       isLowToHigh:
              //                                                           false,
              //                                                       isOnSale:
              //                                                           false,
              //                                                       isNewArrival:
              //                                                           true,
              //                                                       isFeatured:
              //                                                           false);
              //                                                 });
              //                                               }
              //                                             },
              //                                             checkboxValue:
              //                                                 isNewArrivalSelected),
              //                                         // RadioListTile<SortOption>(
              //                                         //   title:
              //                                         //       Text("New Arrivals"),
              //                                         //   value:
              //                                         //       SortOption.newArrival,
              //                                         //   groupValue:
              //                                         //       _selectedOption,
              //                                         //   onChanged:
              //                                         //       (SortOption? value) {
              //                                         //     setState(() {
              //                                         //       _selectedOption =
              //                                         //           value;
              //                                         //     });
              //                                         //   },
              //                                         // ),
              //                                         Divider(
              //                                           height: 2,
              //                                           thickness: 1,
              //                                           color: Colors.grey[300],
              //                                           endIndent: 10,
              //                                           indent: 10,
              //                                         ),
              //                                         sortSelectionWidget(
              //                                             title:
              //                                                 "Price (High to Low)",
              //                                             onChanged:
              //                                                 (bool? isSelected) {
              //                                               if (isSelected ??
              //                                                   false) {
              //                                                 setState(() {
              //                                                   onSortOrderChanged(
              //                                                       isHighToLow:
              //                                                           true,
              //                                                       isLowToHigh:
              //                                                           false,
              //                                                       isOnSale:
              //                                                           false,
              //                                                       isNewArrival:
              //                                                           false,
              //                                                       isFeatured:
              //                                                           false);
              //                                                 });
              //                                               }
              //                                             },
              //                                             checkboxValue:
              //                                                 isHighToLowSelected),

              //                                         // RadioListTile<SortOption>(
              //                                         //   title:
              //                                         //       Text("High to Low"),
              //                                         //   value:
              //                                         //       SortOption.highToLow,
              //                                         //   groupValue:
              //                                         //       _selectedOption,
              //                                         //   onChanged:
              //                                         //       (SortOption? value) {
              //                                         //     setState(() {
              //                                         //       _selectedOption =
              //                                         //           value;
              //                                         //     });
              //                                         //   },
              //                                         // ),

              //                                         Divider(
              //                                           height: 2,
              //                                           thickness: 1,
              //                                           color: Colors.grey[300],
              //                                           endIndent: 10,
              //                                           indent: 10,
              //                                         ),
              //                                         sortSelectionWidget(
              //                                           title:
              //                                               "Price (Low to High)",
              //                                           onChanged:
              //                                               (bool? isSelected) {
              //                                             if (isSelected ??
              //                                                 false) {
              //                                               setState(() {
              //                                                 onSortOrderChanged(
              //                                                     isHighToLow:
              //                                                         false,
              //                                                     isLowToHigh:
              //                                                         true,
              //                                                     isOnSale: false,
              //                                                     isNewArrival:
              //                                                         false,
              //                                                     isFeatured:
              //                                                         false);
              //                                               });
              //                                             }
              //                                           },
              //                                           checkboxValue:
              //                                               isLowToHighSelected,
              //                                         ),
              //                                         // RadioListTile<SortOption>(
              //                                         //   title:
              //                                         //       Text("Low to High"),
              //                                         //   value:
              //                                         //       SortOption.lowToHigh,
              //                                         //   groupValue:
              //                                         //       _selectedOption,
              //                                         //   onChanged:
              //                                         //       (SortOption? value) {
              //                                         //     setState(() {
              //                                         //       _selectedOption =
              //                                         //           value;
              //                                         //     });
              //                                         //   },
              //                                         // ),
              //                                         Divider(
              //                                           height: 2,
              //                                           thickness: 1,
              //                                           color: Colors.grey[300],
              //                                           endIndent: 10,
              //                                           indent: 10,
              //                                         ),

              //                                         sortSelectionWidget(
              //                                             title: "On Sale",
              //                                             onChanged:
              //                                                 (bool? isSelected) {
              //                                               if (isSelected ??
              //                                                   false) {
              //                                                 setState(() {
              //                                                   onSortOrderChanged(
              //                                                       isHighToLow:
              //                                                           false,
              //                                                       isLowToHigh:
              //                                                           false,
              //                                                       isOnSale:
              //                                                           true,
              //                                                       isNewArrival:
              //                                                           false,
              //                                                       isFeatured:
              //                                                           false);
              //                                                 });
              //                                               }
              //                                             },
              //                                             checkboxValue:
              //                                                 isOnSaleSelected),
              //                                         // RadioListTile<SortOption>(
              //                                         //   title: Text("On Sale"),
              //                                         //   value: SortOption.onSale,
              //                                         //   groupValue:
              //                                         //       _selectedOption,
              //                                         //   onChanged:
              //                                         //       (SortOption? value) {
              //                                         //     setState(() {
              //                                         //       _selectedOption =
              //                                         //           value;
              //                                         //     });
              //                                         //   },
              //                                         // ),
              //                                         Divider(
              //                                           height: 2,
              //                                           thickness: 1,
              //                                           color: Colors.grey[300],
              //                                           endIndent: 10,
              //                                           indent: 10,
              //                                         ),
              //                                         sortSelectionWidget(
              //                                             title: "Featured",
              //                                             onChanged:
              //                                                 (bool? isSelected) {
              //                                               if (isSelected ??
              //                                                   false) {
              //                                                 setState(() {
              //                                                   onSortOrderChanged(
              //                                                       isHighToLow:
              //                                                           false,
              //                                                       isLowToHigh:
              //                                                           false,
              //                                                       isOnSale:
              //                                                           false,
              //                                                       isNewArrival:
              //                                                           false,
              //                                                       isFeatured:
              //                                                           true);
              //                                                 });
              //                                               }
              //                                             },
              //                                             checkboxValue:
              //                                                 isFeaturedSelected),

              //                                         // RadioListTile<SortOption>(
              //                                         //   title: const Text(
              //                                         //       "Featured"),
              //                                         //   value:
              //                                         //       SortOption.featured,
              //                                         //   groupValue:
              //                                         //       _selectedOption,
              //                                         //   onChanged:
              //                                         //       (SortOption? value) {
              //                                         //     setState(() {
              //                                         //       _selectedOption =
              //                                         //           value;
              //                                         //     });
              //                                         //   },
              //                                         // ),

              //                                         Divider(
              //                                           height: 2,
              //                                           thickness: 1,
              //                                           color: Colors.grey[300],
              //                                           endIndent: 10,
              //                                           indent: 10,
              //                                         ),
              //                                         // sortSelectionWidget(
              //                                         //     title: "Top Seller",
              //                                         //     onChanged:
              //                                         //         (bool? isSelected) {
              //                                         //       setState(() {
              //                                         //         sortChecks[3] =
              //                                         //             isSelected ??
              //                                         //                 false;
              //                                         //       });
              //                                         //     },
              //                                         //     checkboxValue:
              //                                         //         sortChecks[3]),
              //                                         // Divider(
              //                                         //   height: 2,
              //                                         //   thickness: 1,
              //                                         //   color: Colors.grey[300],
              //                                         //   endIndent: 10,
              //                                         //   indent: 10,
              //                                         // ),
              //                                         const SizedBox(
              //                                           height: 20,
              //                                         ),
              //                                       ],
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                               GestureDetector(
              //                                 onTap: () {
              //                                   Provider.of<CategoryProductProvider>(
              //                                           context,
              //                                           listen: false)
              //                                       .sortSubCategory(
              //                                           _selectedOption);
              //                                   Navigator.pop(context);
              //                                 },
              //                                 child: Container(
              //                                   height: 50,
              //                                   width: MediaQuery.of(context)
              //                                           .size
              //                                           .width *
              //                                       0.9,
              //                                   decoration: BoxDecoration(
              //                                       color:
              //                                           AppConstants.greenColor,
              //                                       borderRadius:
              //                                           BorderRadius.circular(
              //                                               12)),
              //                                   alignment: Alignment.center,
              //                                   child: Text(
              //                                     "Apply",
              //                                     style: AppConstants.h1Normal
              //                                         .copyWith(
              //                                             color: AppConstants
              //                                                 .whiteColor,
              //                                             letterSpacing: 1),
              //                                   ),
              //                                 ),
              //                               )
              //                             ],
              //                           ),
              //                         ),
              //                       );
              //                     }));
              //           })
              //     ],
              //   ),
              // ),

              // Consumer<CategoryProductProvider>(builder: (context, value, child) {
              //   if (value.filteredSubCategories.isEmpty) {
              //     return const Center(
              //       child: CircularProgressIndicator.adaptive(),
              //     );
              //   }
              //   return _buildTabContent(
              //       subCategories: value.filteredSubCategories);
              // })
            ],
          ),
        ),
      ),
    );
  }
}
