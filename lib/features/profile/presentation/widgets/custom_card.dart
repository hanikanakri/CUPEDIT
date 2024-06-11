import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class CustomCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Icon? icon;

  const CustomCard({super.key, this.title, this.subTitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle the tap event
      },
      child: Container(
        height: 69,
        // Quarter of screen height
        padding: const EdgeInsets.symmetric(horizontal: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.grey40,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.grey40,
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null ? icon! : const SizedBox(),
            const SizedBox(
              width: 9,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title != null ? title! : "",
                    style: AppTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subTitle != null ? subTitle! : "",
                    style: AppTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
