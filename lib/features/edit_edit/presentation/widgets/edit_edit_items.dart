import '/core/constants/app_assets.dart';

class EditEditItems {
  final String? editEditItemsName;
  final String? editEditItemsAssets;

  static List<EditEditItems> editEditItemsList = [
    EditEditItems(
        editEditItemsName: "split",
        editEditItemsAssets: AppAssets.splitEditEdit),
    EditEditItems(
        editEditItemsName: "speed",
        editEditItemsAssets: AppAssets.speedEditEdit),
    EditEditItems(
        editEditItemsName: "animations",
        editEditItemsAssets: AppAssets.animationEditEdit),
    EditEditItems(
        editEditItemsName: "style",
        editEditItemsAssets: AppAssets.styleEditEdit),
    EditEditItems(
        editEditItemsName: "delete",
        editEditItemsAssets: AppAssets.deleteEditEdit),
    EditEditItems(
        editEditItemsName: "enhance_voice",
        editEditItemsAssets: AppAssets.enhanceVoiceEditEdit),
    EditEditItems(
        editEditItemsName: "isolate_voice",
        editEditItemsAssets: AppAssets.isolateVoiceEditEdit),
    EditEditItems(
        editEditItemsName: "retouch",
        editEditItemsAssets: AppAssets.retouchEditEdit),
    EditEditItems(
        editEditItemsName: "volume",
        editEditItemsAssets: AppAssets.volumeEditEdit),
    EditEditItems(
        editEditItemsName: "transform",
        editEditItemsAssets: AppAssets.transformEditEdit),
    EditEditItems(
        editEditItemsName: "auto_reframe",
        editEditItemsAssets: AppAssets.autoReframeEditEdit),
    EditEditItems(
        editEditItemsName: "adjust", editEditItemsAssets: AppAssets.adjustItem),
    EditEditItems(
        editEditItemsName: "filters",
        editEditItemsAssets: AppAssets.filtersItem),
    EditEditItems(
        editEditItemsName: "remove_bg",
        editEditItemsAssets: AppAssets.removeBGEditEdit),
    EditEditItems(
        editEditItemsName: "overlay",
        editEditItemsAssets: AppAssets.overlayItem),
    EditEditItems(
        editEditItemsName: "basic",
        editEditItemsAssets: AppAssets.basicEditEdit),
    EditEditItems(
        editEditItemsName: "edit_on_hypic",
        editEditItemsAssets: AppAssets.editOnHypicEditEdit),
    EditEditItems(
        editEditItemsName: "mask", editEditItemsAssets: AppAssets.maskEditEdit),
    EditEditItems(
        editEditItemsName: "duplicate",
        editEditItemsAssets: AppAssets.duplicateEditEdit),
    EditEditItems(
        editEditItemsName: "replace",
        editEditItemsAssets: AppAssets.replicateEditEdit),
    EditEditItems(
        editEditItemsName: "extract_audio",
        editEditItemsAssets: AppAssets.extractAudioEdit),
    EditEditItems(
        editEditItemsName: "motion_blur",
        editEditItemsAssets: AppAssets.motionBlurEditEdit),
    EditEditItems(
        editEditItemsName: "stabilize",
        editEditItemsAssets: AppAssets.stabilizeEditEdit),
    EditEditItems(
        editEditItemsName: "opacity",
        editEditItemsAssets: AppAssets.opacityEditEdit),
    EditEditItems(
        editEditItemsName: "reverse",
        editEditItemsAssets: AppAssets.reverseEditEdit),
    EditEditItems(
        editEditItemsName: "freeze",
        editEditItemsAssets: AppAssets.freezeEditEdit),
    EditEditItems(
        editEditItemsName: "voice_effects",
        editEditItemsAssets: AppAssets.voiceEffectsEditEdit),
    EditEditItems(
        editEditItemsName: "reduce_noise",
        editEditItemsAssets: AppAssets.reduceNoiseEditEdit),
    EditEditItems(
        editEditItemsName: "beats",
        editEditItemsAssets: AppAssets.beatsEditEdit),
  ];

  EditEditItems({
    this.editEditItemsAssets,
    this.editEditItemsName,
  });
}
