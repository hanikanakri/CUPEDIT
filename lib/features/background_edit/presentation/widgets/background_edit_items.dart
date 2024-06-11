import '/core/constants/app_assets.dart';

class BackgroundEditItems {
  final String? backgroundEditItemsName;
  final String? backgroundEditItemsAssets;

  static List<BackgroundEditItems> backgroundEditItemsList = [
    BackgroundEditItems(
        backgroundEditItemsName: "color",
        backgroundEditItemsAssets: AppAssets.colorBackgroundEdit),
    BackgroundEditItems(
        backgroundEditItemsName: "image",
        backgroundEditItemsAssets: AppAssets.imageBackgroundEdit),
    BackgroundEditItems(
        backgroundEditItemsName: "blur",
        backgroundEditItemsAssets: AppAssets.blurBackgroundEdit),
  ];

  BackgroundEditItems({
    this.backgroundEditItemsAssets,
    this.backgroundEditItemsName,
  });
}
