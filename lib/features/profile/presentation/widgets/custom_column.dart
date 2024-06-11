import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_theme.dart';

class CustomColumn extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Widget? additionalCard;

  const CustomColumn({super.key, 
    this.title,
    this.subTitle,
    this.additionalCard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title!, style: AppTheme.headline6),
            const SizedBox(
              width: 8,
            ),
            if (additionalCard != null) additionalCard!,
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Text(subTitle!,
            style: AppTheme.headline6.copyWith(color: AppColors.grey60)),
      ],
    );
  }
}
