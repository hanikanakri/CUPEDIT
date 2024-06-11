 import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import 'InboxCardCustom.dart';

class CapCutOfficial extends StatelessWidget {
  final List<Map<String, String>> dataList = [
    {'title': 'Retouch features just got better on CapCuts desktop app',
      'subtitle': 'try feature lke retouch ,reshap and makeup to add extra polish to your creations.download the CapCute desktop app and see for your self now !'},
    {'title': 'Retouch features just got better on CapCuts desktop app',
      'subtitle': 'try feature lke retouch ,reshap and makeup to add extra polish to your creations.download the CapCute desktop app and see for your self now !'},


    {'title': 'Retouch features just got better on CapCuts desktop app',
      'subtitle': 'try feature lke retouch ,reshap and makeup to add extra polish to your creations.download the CapCute desktop app and see for your self now !'},
  ];

   CapCutOfficial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(8) ,
      color: AppColors.grey4,

            child: MyCard(dataList: dataList),

    );
  }
}
