import '/core/constants/app_assets.dart';

class TextEditItems {
  final String? textEditItemsName;
  final String? textEditItemsAssets;

  static List<TextEditItems> textEditItemsList = [
    TextEditItems(
        textEditItemsName: "add_text",
        textEditItemsAssets: AppAssets.addTextTextEdit),
    TextEditItems(
        textEditItemsName: "stickers",
        textEditItemsAssets: AppAssets.stickersTextEdit),
    TextEditItems(
        textEditItemsName: "auto_captions",
        textEditItemsAssets: AppAssets.autoCaptionsTextEdit),
    TextEditItems(
        textEditItemsName: "text_template",
        textEditItemsAssets: AppAssets.textTemplateTextEdit),
    TextEditItems(
        textEditItemsName: "auto_lyrics",
        textEditItemsAssets: AppAssets.autoLyricsTextEdit),
    TextEditItems(
        textEditItemsName: "draw", textEditItemsAssets: AppAssets.drawTextEdit),
  ];

  TextEditItems({
    this.textEditItemsAssets,
    this.textEditItemsName,
  });
}
