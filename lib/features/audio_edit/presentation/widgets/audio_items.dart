import '/core/constants/app_assets.dart';

class AudioItemsNames {
  String? audioItemNames;
  String? audioItemAssets;

  static List<AudioItemsNames> audioItemList = [
    AudioItemsNames(
        audioItemNames: "sounds", audioItemAssets: AppAssets.soundsAudioEdit),
    AudioItemsNames(
        audioItemNames: "copyright",
        audioItemAssets: AppAssets.copyrightAudioEdit),
    AudioItemsNames(
        audioItemNames: "sound_fx",
        audioItemAssets: AppAssets.soundFxAudioEdit),
    AudioItemsNames(
        audioItemNames: "extract", audioItemAssets: AppAssets.extractAudioEdit),
    AudioItemsNames(
        audioItemNames: "record", audioItemAssets: AppAssets.recordAudioEdit),
  ];

  AudioItemsNames({
    this.audioItemAssets,
    this.audioItemNames,
  });
}
