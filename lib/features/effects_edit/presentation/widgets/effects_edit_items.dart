import '/core/constants/app_assets.dart';

class EffectsEditItems {
  final String? effectsEditItemsName;
  final String? effectsEditItemsAssets;

  static List<EffectsEditItems> textEditItemsList = [
    EffectsEditItems(
        effectsEditItemsName: "video_effects",
        effectsEditItemsAssets: AppAssets.videoEffectsEffectsEdit),
    EffectsEditItems(
        effectsEditItemsName: "body_effects",
        effectsEditItemsAssets: AppAssets.bodyEffectsEffectsEdit),
    EffectsEditItems(
        effectsEditItemsName: "photo_effects",
        effectsEditItemsAssets: AppAssets.photoEffectsEffectsEdit),
  ];

  EffectsEditItems({
    this.effectsEditItemsAssets,
    this.effectsEditItemsName,
  });
}
