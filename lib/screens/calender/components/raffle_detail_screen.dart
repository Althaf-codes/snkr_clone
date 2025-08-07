import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:snkr_app/utils/contants.dart';

class RaffleDetailScreen extends StatefulWidget {
  final String productId;
  const RaffleDetailScreen({super.key, required this.productId});

  @override
  State<RaffleDetailScreen> createState() => _RaffleDetailScreenState();
}

class _RaffleDetailScreenState extends State<RaffleDetailScreen> {
  late ScrollController _scrollController;
  late ScrollController _imgScrollController;
  int _currentIndex = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _imgScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _imgScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    shrinkWrap: true,
                    controller: _scrollController,
                    children: [
                      Hero(
                        transitionOnUserGestures: true,
                        tag: widget.productId,
                        child: Material(
                          child: Container(
                            height: 400,
                            alignment: Alignment.topCenter,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    alignment: Alignment.center,
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1542291026-7eec264c27ff?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXxlbnwwfHwwfHx8MA%3D%3D"),
                                    fit: BoxFit.cover)),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: AppConstants.grayColor,
                                      child: const Icon(
                                        Icons.close,
                                        color: AppConstants.whiteColor,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        // color: Colors.blue,
                        child: ListView.builder(
                            controller: _imgScrollController,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: _currentIndex == index
                                          ? Border.all(
                                              color:
                                                  AppConstants.lightBlackColor)
                                          : Border.all(style: BorderStyle.none),
                                    ),
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1542291026-7eec264c27ff?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXxlbnwwfHwwfHx8MA%3D%3D",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Jordan",
                        // widget.product.brandName,
                        style: AppConstants.h1Normal.copyWith(
                            color: AppConstants.secondaryColor,
                            fontSize: 20,
                            letterSpacing: 1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Air Jordan 1 Low OG 'MOCHA'",
                        // widget.product.title, //"Biosline Omega 3/6 60Sg Cap",
                        style: AppConstants.h1Bold.copyWith(
                          // fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          color: AppConstants.secondaryColor,
                          fontSize: 28,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Price:",
                            style: AppConstants.headingBlackBold.copyWith(
                                color: AppConstants.secondaryColor,
                                fontSize: 19),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "KWD 61.500",
                            style: AppConstants.h1Normal.copyWith(
                              fontSize: 20,
                              color: AppConstants.secondaryColor,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Sizes:",
                            style: AppConstants.headingBlackBold.copyWith(
                                color: AppConstants.secondaryColor,
                                fontSize: 19),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "8 - 13 US",
                            style: AppConstants.h1Normal.copyWith(
                              fontSize: 20,
                              color: AppConstants.secondaryColor,
                            ),
                          )
                        ],
                      ),
                      AppConstants.height20,
                      Divider(
                        height: 10,
                        color: Colors.grey[300],
                        thickness: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          shape: const RoundedRectangleBorder(),
                          tilePadding: const EdgeInsets.only(left: 4),
                          backgroundColor: AppConstants.whiteColor,
                          collapsedBackgroundColor: AppConstants.whiteColor,
                          title: Text(
                            "Description",
                            style: AppConstants.h1Normal
                                .copyWith(fontSize: 20, letterSpacing: 1),
                            textAlign: TextAlign.start,
                          ),
                          children: [
                            const Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12),
                              child: MarkdownBody(data: '''
      **About the product**  
      A limited edition skincare set featuring essential products for radiant skin.
      
      **Description**  
      Includes a cleanser, toner, and moisturizer with nourishing ingredients.
      
      **How to Use**  
      Apply the cleanser to damp skin, rinse, and follow up with toner and moisturizer.
      
      **Benefits**  
      - Hydrates skin deeply  
      - Reduces redness  
      - Brightens complexion  
      '''),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      AppConstants.height10,
                      Text(
                        "Raffle Closed",
                        style: AppConstants.h1Normal
                            .copyWith(fontSize: 20, letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );

    // return SizedBox(
    //   height: MediaQuery.of(context).size.height,
    //   width: MediaQuery.of(context).size.width,
    //   child: SingleChildScrollView(
    //     child: Column(
    //       children: [],
    //     ),
    //   ),
    // );
  }
}
