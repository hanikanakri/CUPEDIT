import 'package:easy_localization/easy_localization.dart';

import '/core/constants/app_assets.dart';

//Translation
class GridItemTranslation {
/*  static List<String> itemNames = [
    "photo_edit".tr(),
    "text_to_image".tr(),
    "autoCut".tr(),
    "prodect_photo".tr(),
    "collapse".tr(),
    "ai_poster".tr(),
    "ai_model".tr(),
    "camera".tr(),
    "retouch".tr(),
    "auto_captions".tr(),
    "teleprompter".tr(),
    "remove_background".tr(),
    "image_enhancement".tr(),
  ];

  static List<String> translatedStrings =
  itemNames.map((string) => tr(string)).toList();

  static List<String> itemIcons = [
    AppAssets.homePageIconEdit,
    AppAssets.homePageIconImage,
    AppAssets.homePageAutoCut,
    AppAssets.homePageProductPhoto,
    AppAssets.homePageCollapse,
    AppAssets.homePageAiPoster,
    AppAssets.homePageAiModel,
    AppAssets.homePageCamera,
    AppAssets.homePageRetouch,
    AppAssets.homePageAutoCaptions,
    AppAssets.homePageTeleprompter,
    AppAssets.homePageImageRemoveBackground,
    AppAssets.homePageImageEnhancement,
  ];*/
  String? text;
  String? assets;

  static List<GridItemTranslation> grid = [
    GridItemTranslation(
      text: "photo_edit".tr(),
      assets: AppAssets.homePageIconEdit,
    ),
    GridItemTranslation(
      text: "text_to_image".tr(),
      assets: AppAssets.homePageIconImage,
    ),
    GridItemTranslation(
      text: "autoCut".tr(),
      assets: AppAssets.homePageAutoCut,
    ),
    GridItemTranslation(
      text: "prodect_photo".tr(),
      assets: AppAssets.homePageProductPhoto,
    ),
    GridItemTranslation(
      text: "collapse".tr(),
      assets: AppAssets.homePageCollapse,
    ),
    GridItemTranslation(
      text: "ai_poster".tr(),
      assets: AppAssets.homePageAiPoster,
    ),
    GridItemTranslation(
      text: "ai_model".tr(),
      assets: AppAssets.homePageAiModel,
    ),
    GridItemTranslation(
      text: "camera".tr(),
      assets: AppAssets.homePageCamera,
    ),
    GridItemTranslation(
      text: "retouch".tr(),
      assets: AppAssets.homePageRetouch,
    ),
    GridItemTranslation(
      text: "auto_captions".tr(),
      assets: AppAssets.homePageAutoCaptions,
    ),
    GridItemTranslation(
      text: "teleprompter".tr(),
      assets: AppAssets.homePageTeleprompter,
    ),
    GridItemTranslation(
      text: "remove_background".tr(),
      assets: AppAssets.homePageImageRemoveBackground,
    ),
    GridItemTranslation(
      text: "image_enhancement".tr(),
      assets: AppAssets.homePageImageEnhancement,
    ),
  ];

  GridItemTranslation({
    this.assets,
    this.text,
  });
}
