import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/common/widgets/custom_appbar.dart';
import 'package:snkr_app/common/widgets/custom_container.dart';
import 'package:snkr_app/provider/drawer_provider.dart';
import 'package:snkr_app/utils/contants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      accountItem(
                          title: "Sign in",
                          iconData: Icons.login_outlined,
                          ontap: () {}),
                      accountItem(
                          title: "Add GiftCard",
                          iconData: Icons.card_giftcard,
                          ontap: () {}),
                      AppConstants.height20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "General Settings",
                          style: AppConstants.h1Bold.copyWith(
                              fontSize: 22, color: AppConstants.grayColor),
                        ),
                      ),
                      AppConstants.height20,
                      accountItem(
                          title: "Our Store Locations",
                          iconData: Icons.map_outlined,
                          ontap: () {}),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications_none_outlined,
                                  color: AppConstants.lightBlackColor,
                                  size: 24,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Manage Notification',
                                    style: AppConstants.h1Normal
                                        .copyWith(fontSize: 18),
                                  ),
                                  Text(
                                    "Please go to Settings> Notifications for the 'SNKR' app",
                                    style: AppConstants.h1Normal.copyWith(
                                        fontSize: 18,
                                        color: AppConstants.lightBlackColor),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: AppConstants.lightBlackColor,
                                  size: 18,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      accountItem(
                          title: "Terms & Conditions",
                          iconData: Icons.note_outlined,
                          ontap: () {}),
                      accountItem(
                          title: "Privacy & Policy",
                          iconData: Icons.sticky_note_2_outlined,
                          ontap: () {}),
                      accountItem(
                          title: "Return Policy",
                          iconData: Icons.history_outlined,
                          ontap: () {}),
                      accountItem(
                          title: "Shipping Policy",
                          iconData: Icons.local_shipping_outlined,
                          ontap: () {}),
                      accountItem(
                          title: "About Us",
                          iconData: Icons.info_outline,
                          ontap: () {}),
                      Divider(
                          height: 1,
                          thickness: 1,
                          endIndent: 20,
                          indent: 20,
                          color: Colors.grey[300]),
                      accountItem(
                          title: "Contact Us",
                          iconData: Icons.contact_support_sharp,
                          ontap: () {}),
                      Divider(
                          height: 1,
                          thickness: 1,
                          endIndent: 20,
                          indent: 20,
                          color: Colors.grey[300]),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }

  Widget accountItem({
    required String title,
    required IconData iconData,
    required VoidCallback ontap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                iconData,
                color: AppConstants.lightBlackColor,
                size: 24,
              )),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: AppConstants.h1Normal.copyWith(fontSize: 18),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppConstants.lightBlackColor,
                size: 18,
              )),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
