import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../data/system_notification.dart';
import 'InboxCardCustom.dart';

class CapCutOfficial extends StatelessWidget {
  List<SystemNotification> inboxCards = [
    SystemNotification(
        "2022-01-01",
        'Retouch features just got better on CapCuts desktop app',
        'try feature lke retouch ,reshap and makeup to add extra polish to your creations.download the CapCute desktop app and see for your self now !'),
    SystemNotification(
        "2022-01-01",
        'Retouch features just got better on CapCuts desktop app',
        'try feature lke retouch ,reshap and makeup to add extra polish to your creations.download the CapCute desktop app and see for your self now !'),
    SystemNotification(
        "2022-01-01",
        'Retouch features. just got better on CapCuts desktop app',
        'try feature lke retouch ,reshap and makeup to add extra polish to your creations.download the CapCute desktop app and see for your self now !'),
  ];

  CapCutOfficial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.grey50,
        child: ListView.builder(
          itemCount: inboxCards.length,
          itemBuilder: (context, index) {
            SystemNotification systemNotification = inboxCards[index];
            return InboxCardCustom(
              systemNotification: systemNotification,
            );
          },
        ));
  }
}
