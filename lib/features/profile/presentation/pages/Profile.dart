import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../home/presentation/widgets/general_home_page_scaffold.dart';
import '../../../manage/presentation/widgets/custom_account_row.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_column.dart';
import '../widgets/custom_edit_profile_.dart';
import '../widgets/custom_followers.dart';
import '../widgets/custom_profile_appbar.dart';
import '../widgets/custom_profile_drawer.dart';
import '../widgets/custom_row.dart';
import '../widgets/custom_trends.dart';
import '../widgets/profile_rectangel.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralHomePageScaffold(
      index: 3,
      drawerWidget: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              const CustomProfileAppbar(),
              const CustomRowAccount(
                image: AppAssets.profileTikTok,
                widge: CustomColumn(
                  title: "Tik tok",
                  subTitle: "كاسر",
                  additionalCard: ProfileRectangle(),
                ),
              ),
              const SizedBox(height: 10),
              const CustomFollowersWidget(),
              const SizedBox(height: 10),
              CustomRow(
                text: "add_bio".tr(),
                leadingIcon: CustomImage.rectangle(
                  height: 18,
                  width: 18,
                  image: AppAssets.pencilIcon,
                ),
              ),
              const SizedBox(height: 4),
              CustomRow(
                text: "tik_tok".tr(),
                leadingIcon: const Icon(Icons.tiktok_rounded, size: 14),
                trailingIcon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 11,
                ),
              ),
              const SizedBox(height: 10),
              const CustomEditProfile(),
              const SizedBox(height: 10),
              CustomTrends(),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      title: "view_history".tr(),
                      subTitle: "Recently viewed ..",
                      icon: const Icon(Icons.history),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: CustomCard(
                      title: "apply_tobe_creater".tr(),
                      subTitle: "create my one...",
                      icon: const Icon(Icons.history),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
