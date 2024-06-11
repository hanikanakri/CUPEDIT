import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InboxAppBar extends StatelessWidget implements PreferredSizeWidget {
  List<String> tabNames = [
    'cupedit_official'.tr(),
    'interactions'.tr(),
    'features'.tr(),
  ];

  InboxAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> translatedStrings =
        tabNames.map((string) => tr(string)).toList();

    return AppBar(
      toolbarHeight: 700.0, // add this line

      title: Text('inbox'.tr(),
          textAlign: TextAlign.center, style: AppTheme.headline6),
      centerTitle: true,
      bottom: TabBar(
        indicatorColor: AppColors.black,
        labelColor: AppColors.black,
        unselectedLabelColor: AppColors.grey60,
        indicatorPadding: const EdgeInsets.all(0.0),
        indicatorWeight: 4.0,
        labelPadding: const EdgeInsets.only(left: 2.0, right: 2.0),
        tabs: translatedStrings.map((String tabName) {
          return Tab(
            child: Text(
              tabName,
              style:AppTheme.bodyText1 ,
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Size get preferredSize {
    const double appBarHeight = kToolbarHeight + kTextTabBarHeight;
    return const Size.fromHeight(appBarHeight);
  }
}
