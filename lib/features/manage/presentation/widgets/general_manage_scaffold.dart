import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class GeneralManageScaffold extends StatelessWidget {
  final Widget? body;
  final Color? backgroundColor;

  const GeneralManageScaffold({
    Key? key,
    this.body,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "manage_account".tr(),
          style: AppTheme.headline,
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              icon: const Icon(Icons.arrow_forward_ios_sharp)),
        ],
      ),
      backgroundColor: backgroundColor ?? AppColors.white,
      resizeToAvoidBottomInset: false,
      // Conditionally show or hide the app bar
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: body ?? const SizedBox(),
      ),
    );
  }
}
