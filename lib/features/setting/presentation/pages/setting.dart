import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/features/setting/presentation/widgets/custom_switch_widget.dart';
import '/features/setting/presentation/widgets/setting_card_custom.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      color: AppColors.white,
      child: ListView(
        children: [
          SettingCardCustom(
            title: "add_default_ending".tr(),
            widget:  const CustomSwitchWidget(),
          ),
          SettingCardCustom(
            title: "add_default_ending".tr(),
            widget: CustomIconWidget(
              () {},
            ),
          ),
          SettingCardCustom(
            title: "auto_upload".tr(),
            widget: CustomIconWidget(
              () {},
            ),
          ),
          SettingCardCustom(
            title: "feedback".tr(),
            widget: CustomIconWidget(
              () {},
            ),
          ),
          SettingCardCustom(
            title: "cupedit_community_guidelines".tr(),
            widget: CustomIconWidget(
              () {},
            ),
          ),
          SettingCardCustom(
            title: "terms_of_service".tr(),
            widget: CustomIconWidget(
              () {},
            ),
          ),
          SettingCardCustom(
            title: "privacy_policy".tr(),
            widget: CustomIconWidget(
              () {},
            ),
          ),
          SettingCardCustom(
            title: "open_source_software_notice".tr(),
            widget: CustomIconWidget(
              () {},
            ),
          ),
          SettingCardCustom(
            title: "clear_cache".tr(),
            widget: Text(
              "975.68M",
              style: AppTheme.bodySmall.copyWith(color: AppColors.black),
            ),
          ),
          SettingCardCustom(
            title: "version".tr(),
            widget: Text(
              "1",
              style: AppTheme.bodySmall.copyWith(color: AppColors.black),
            ),
          ),
        ]
            .map(
              (e) => Padding(
                padding: const EdgeInsets.all(8),
                child: e,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget CustomIconWidget(VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: const Icon(Icons.chevron_right),
    );
  }
}
