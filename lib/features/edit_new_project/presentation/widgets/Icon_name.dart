import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/custom_image.dart';

class IconName extends StatelessWidget {
  const IconName({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
    this.horizontal = 6.0,
  });

  final String icon;
  final String name;
  final double horizontal;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          //vertical: 0,
          horizontal: horizontal,
        ),
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(2),
                child: CustomImage.rectangle(
                  image: icon,
                  isNetworkImage: false,
                  svg: false,
                  fit: BoxFit.cover,
                  color: AppColors.white,
                ),
              ),
            ),
            Expanded(
              child: Text(
                name.tr(),
                style: AppTheme.bodySmall.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemsName {
  String? nameItem;
  String? nameAssets;

  static List<ItemsName> listOfItems = [
    ItemsName(nameItem: 'edit_edit', nameAssets: AppAssets.cutItem),
    ItemsName(nameItem: "audio", nameAssets: AppAssets.audioItem),
    ItemsName(nameItem: 'text', nameAssets: AppAssets.textItem),
    ItemsName(nameItem: "overlay", nameAssets: AppAssets.overlayItem),
    ItemsName(nameItem: "effects_edit", nameAssets: AppAssets.effectsItem),
    ItemsName(nameItem: "aspect_ratio", nameAssets: AppAssets.aspectRatioItem),
    ItemsName(nameItem: "filters", nameAssets: AppAssets.filtersItem),
    ItemsName(nameItem: "adjust", nameAssets: AppAssets.adjustItem),
    ItemsName(nameItem: "stickers", nameAssets: AppAssets.layersItem),
    ItemsName(nameItem: "background", nameAssets: AppAssets.backgroundItem),
  ];

  ItemsName({
    this.nameAssets,
    this.nameItem,
  });
}
