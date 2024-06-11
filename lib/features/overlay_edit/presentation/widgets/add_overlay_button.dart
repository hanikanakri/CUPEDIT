import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class AddOverlayButton extends StatelessWidget {
  const AddOverlayButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.white,
                ),
              ),
              //padding: EdgeInsets.all(0),
              margin: const EdgeInsets.all(5),
              child: const Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
            Text(
              "add_overlay".tr(),
              style: AppTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
