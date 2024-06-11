// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CustomDrawer extends StatelessWidget {
//   List<String> drawerItems = [
//     'scan'.tr(),
//     'blocked_accounts'.tr(),
//     'manage_accounts'.tr(),
//   ];
//
//   List<IconData> drawerIcons = [
//     Icons.scanner,
//     Icons.block,
//     Icons.settings,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> translatedStrings =
//         drawerItems.map((string) => tr(string)).toList();
//     return Drawer(
//       // Customize the drawer as needed
//       child: ListView.builder(
//         itemCount: translatedStrings.length,
//         itemBuilder: (context, index) {
//           final item = translatedStrings[index];
//           final icon = drawerIcons[index];
//           return ListTile(
//             title: Text(item),
//             leading: Icon(icon),
//             onTap: () {
//               // Handle drawer item tap
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/animations/navigation_route_animation/navigation_route_animation.dart';
import '../../../manage/presentation/pages/manage_account.dart';
import '/core/constants/app_assets.dart';
import '/features/profile/presentation/widgets/custom_drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomDrawerItem(
            text: 'scan'.tr(),
            image: AppAssets.scanIcon,
            onTap: () {},
          ),
          CustomDrawerItem(
            text: 'blocked_accounts'.tr(),
            image: AppAssets.blockedAccountsIcon,
            onTap: () {},
          ),
          CustomDrawerItem(
            text: 'manage_accounts'.tr(),
            image: AppAssets.manageAccountsIcon,
            onTap: () {
              AnimationNavigation.slidePush(context, const ManageAcccount());
            },
          ),

          // Add more drawer items as needed
        ],
      ),
    );
  }
}
