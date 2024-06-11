import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class ProfileRectangle extends StatelessWidget {
  const ProfileRectangle({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          gradient: AppColors.ProfilCardGradinet,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: InkWell(
            onTap: onTap,
            child: Text(
              "join_cupedit_pro".tr(),
              style: AppTheme.headline6.copyWith(
                color: AppColors.black,
                fontSize: 9.5,
              ),
            ),
          ),
        ));
  }
}
