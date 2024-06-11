import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_theme.dart';

class SettingCardCustom extends StatelessWidget {
  final String? title;
  final Widget? widget; // New parameter for the icon

  const SettingCardCustom({
    Key? key,
    this.title,
    this.widget, // Add the icon parameter to the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white, // Set the desired background color
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title != null ? title! : "",
              style: AppTheme.bodySmall.copyWith(color: AppColors.black),
            ),
            widget != null ? widget! : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
