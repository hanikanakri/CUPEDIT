import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'custom_column.dart';

class CustomFollowersWidget extends StatelessWidget {
  const CustomFollowersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CustomColumn(
            title: '0',
            subTitle: 'followers'.tr(),
          ),
          const SizedBox(width: 22),
          CustomColumn(
            title: '1',
            subTitle: 'following'.tr(),
          ),
        ],
      ),
    );
  }
}
