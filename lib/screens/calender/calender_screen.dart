import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/common/widgets/custom_appbar.dart';
import 'package:snkr_app/common/widgets/custom_container.dart';
import 'package:snkr_app/provider/drawer_provider.dart';
import 'package:snkr_app/screens/calender/components/coming_soon_card.dart';
import 'package:snkr_app/screens/calender/components/raffle_card.dart';
import 'package:snkr_app/screens/calender/components/raffle_detail_screen.dart';
import 'package:snkr_app/utils/contants.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  // List<>

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: const CustomAppbar()),
      body: Consumer<DrawerProvider>(builder: (context, value, child) {
        bool isDrawerOpen = value.isDrawerOpen;
        return IgnorePointer(
          ignoring: isDrawerOpen,
          child: customContainer(
            context,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // AppConstants.height5,
                  TabBar(
                      controller: _tabController,
                      indicatorColor: AppConstants.grayColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicatorWeight: 3,
                      unselectedLabelColor: AppConstants.blackColor,
                      labelStyle: AppConstants.h1Bold
                          .copyWith(fontSize: 17, letterSpacing: 0.5),
                      labelColor: AppConstants.grayColor,
                      tabs: [
                        Tab(
                          text: "Raffles",
                        ),
                        Tab(
                          text: "Coming Soon",
                        )
                      ]),
                  AppConstants.height10,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.66,
                    width: MediaQuery.of(context).size.width,
                    child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          ListView.builder(
                            // shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RaffleDetailScreen(
                                                  productId: '$index',
                                                )));
                                  },
                                  child: rafflesCard(context,
                                      productId: '$index')),
                            ),
                          ),
                          GridView.builder(
                              controller: ScrollController(),
                              shrinkWrap: true,
                              itemCount: 10, // widget.products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 3 / 5,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 2,
                                      crossAxisSpacing: 2),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: comingSoonCard(),
                                );
                              }),
                        ]),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
