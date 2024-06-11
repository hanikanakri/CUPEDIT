import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';
import '/features/manage/presentation/widgets/account_info_card.dart';
import '/features/manage/presentation/widgets/curom_row_widget.dart';
import '/features/manage/presentation/widgets/custom_account_row.dart';
import '/features/manage/presentation/widgets/general_manage_scaffold.dart';
import '/features/profile/presentation/widgets/custom_column.dart';
import '/features/setting/presentation/widgets/custom_switch_widget.dart';

class ManageAcccount extends StatelessWidget {
  const ManageAcccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralManageScaffold(
      backgroundColor: AppColors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 1),
        child: Column(
          children: [
            AccountInfoCard(
              mainTitle: "contact_information".tr(),
              title: "email".tr(),
              subTitle: "hhhh@gmail.com",
            ),
            AccountInfoCard(
              mainTitle: "security".tr(),
              title: "password".tr(),
              subTitle: "enter_the_password".tr(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: 15,
              color: AppColors.grey40,
            ),
             const CustomRowAccount(
              image: AppAssets.tiktokIcon,
              widge: CustomColumn(
                title: "Tik tok",
                subTitle: "كاسر",
              ),
            ),
            CustomRowWidget(
              firstWidget: Text(
                "display_tik_tok_profile".tr(),
                style: AppTheme.headline6,
              ),
              secondWidget: Align(
                  alignment: SharedStorage.getLanguage() == "en"
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child:  const CustomSwitchWidget()),
            ),
            CustomRowAccount(
              showLinkButton: true,
              image: AppAssets.googleIcon,
              widge: Text(
                "google".tr(),
                style: AppTheme.headline6,
              ),
            ),
            CustomRowAccount(
              showLinkButton: true,
              image: AppAssets.facebookIcon,
              widge: Text(
                "facebook".tr(),
                style: AppTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
