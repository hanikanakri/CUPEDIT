import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../../core/widgets/buttons/main_elevated_button.dart';
import '../../../../core/constants/app_theme.dart';
import 'curom_row_widget.dart';

class CustomRowAccount extends StatelessWidget {
  final String? image;
  final Widget? widge;
  final bool? showLinkButton;

  const CustomRowAccount(
      {super.key, this.image, this.widge, this.showLinkButton = false});

  @override
  Widget build(BuildContext context) {
    return CustomRowWidget(
      image: image,
      firstWidget: widge,
      secondWidget: showLinkButton!
          ? SizedBox(
              height: 30,
              child: MainElevatedButton(
                textStyle: AppTheme.bodySmall.copyWith(color: AppColors.white),
                buttonColor: AppColors.cyan,
                text: "link".tr(),
                onPressed: () {},
              ),
            )
          : const SizedBox(),
    );
  }
}
