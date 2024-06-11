import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_theme.dart';
import '../../../../../core/widgets/custom_image.dart';
import 'custom_inkwell.dart';

class CustomEditProfile extends StatelessWidget {
  const CustomEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: CustomInkwell(
                height: 40,
                child: Text(
                  "edit_profile".tr(),
                  style: AppTheme.bodyText1,
                ),
              ),
            ),
            Expanded(
              child: CustomInkwell(
                height: 40,
                child: CustomImage.rectangle(
                  image: AppAssets.shareIcon,
                ),
              ),
            ),
            Expanded(
              child: CustomInkwell(
                height: 40,
                child: const Icon(Icons.share),
              ),
            ),
          ].expand((x) => [const SizedBox(width: 10), x]).skip(1).toList()),
    );
  }
}
