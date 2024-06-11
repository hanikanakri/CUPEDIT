import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../data/system_notification.dart';
import '/core/constants/app_theme.dart';

class InboxCardCustom extends StatelessWidget {
  final SystemNotification systemNotification;

  const InboxCardCustom({
    Key? key,
    required this.systemNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0, // Set elevation to 0.0

      color: AppColors.white, // Set the desired background color

      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.cut),
                Expanded(
                  child: Text("system_notification".tr(),
                      style: AppTheme.headline3),
                ),
                Text(
                  systemNotification.date != null
                      ? systemNotification.date!
                      : "",
                  style: AppTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                systemNotification.title != null
                    ? systemNotification.title!
                    : "",
                style: AppTheme.headline6),
            const SizedBox(
              height: 10,
            ),
            Text(
                systemNotification.subtitle != null
                    ? systemNotification.subtitle!
                    : "",
                style: AppTheme.bodySmall.copyWith(color: AppColors.grey)),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("view_more".tr(), style: AppTheme.bodyText1),
                const Icon(Icons.chevron_right),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
