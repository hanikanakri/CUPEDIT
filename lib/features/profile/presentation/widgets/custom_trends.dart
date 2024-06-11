import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../data/trend_model.dart';
import '/features/profile/presentation/widgets/trend_custom_card.dart';

class CustomTrends extends StatelessWidget {
  String jsonString = '[{"title": "luna", "followers": "1000","image": '
      '"${AppAssets.profileTikTok}"},'
      ' {"title": "sun", "followers": "2000","image": '
      '"${AppAssets.profileTikTok}"}, '
      '{"title": "star", "followers": "3000","image":'
      ' "${AppAssets.profileTikTok}"}]';

  CustomTrends({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                child: Text(
              "trending_creators".tr(),
              style: AppTheme.bodyText1,
            )),
            Text(
              "view_more".tr(),
              style: AppTheme.bodySmall,
            ),
            const SizedBox(
              width: 3,
            ),
            const Icon(
              size: 10,
              Icons.arrow_forward_ios_sharp,
              color: AppColors.grey60,
            ),
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 172,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              final trendsList = getTrendModelFromJson(jsonString);
              final trend = trendsList[index];
              return TrendCustomCard(
                trendModel: trend,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const VerticalDivider(
                width: 8,
              );
            },
          ),
        ),
      ],
    );
  }
}
