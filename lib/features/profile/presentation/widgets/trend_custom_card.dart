import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_theme.dart';
import '../../../../../../../core/widgets/buttons/main_elevated_button.dart';
import '../../../../../../../core/widgets/custom_image.dart';
import '../../data/trend_model.dart';
import '/core/constants/app_colors.dart';

class TrendCustomCard extends StatelessWidget {
  final TrendModel? trendModel;

  const TrendCustomCard({super.key, this.trendModel});

  @override
  Widget build(BuildContext context) {
    double widthCard = MediaQuery.of(context).size.width / 3.5;

    return Container(
      width: widthCard,
      // Divide the width of the screen by 3
      decoration: BoxDecoration(
        color: AppColors.grey70,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      alignment: Alignment.center,
      child: Column(
        children: [
          CustomImage.circular(
            fit: BoxFit.cover,
            image: trendModel!.image,
            svg: false,
            isNetworkImage: false,
            radius: 50,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            trendModel != null ? trendModel!.title! : "",
            style: AppTheme.bodyText1,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(trendModel != null ? trendModel!.followers! : "",
              style: AppTheme.bodySmall),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: MainElevatedButton(
              textStyle: AppTheme.bodySmall.copyWith(color: AppColors.white),
              buttonColor: AppColors.cyan,
              text: "follow".tr(),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
