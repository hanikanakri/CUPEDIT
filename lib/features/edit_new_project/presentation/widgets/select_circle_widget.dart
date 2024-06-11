// import '/core/constants/app_colors.dart';
// import '/core/constants/app_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';
//
// class SelectCircleWidget extends StatefulWidget {
//    SelectCircleWidget({
//     super.key,
//     required this.selectedAssetList,
//     required this.assetList,
//   });
//
//   List<AssetEntity> selectedAssetList;
//    List<AssetEntity> assetList;
//
//   @override
//   State<SelectCircleWidget> createState() => _SelectCircleWidgetState();
// }
//
// class _SelectCircleWidgetState extends State<SelectCircleWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Positioned.fill(
//       child: Align(
//         alignment: Alignment.topRight,
//         child: GestureDetector(
//           onTap: () => selectedAssets(assetEntity: widget.assetList[widget.index]),
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Container(
//               width: 22.5,
//               height: 22.5,
//               decoration: BoxDecoration(
//                 color: widget.selectedAssetList.contains(widget.assetList[widget.index]) == true
//                     ? AppColors.blue
//                     : AppColors.black12,
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: AppColors.white,
//                   width: 1.5,
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   "${widget.selectedAssetList.indexOf(widget.assetList[widget.index]) + 1}",
//                   style: AppTheme.bodySmall.copyWith(
//                     color: widget.selectedAssetList.contains(widget.assetList[widget.index]) == true
//                         ? AppColors.white
//                         : AppColors.transparent,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//    void selectedAssets({required AssetEntity assetEntity}) {
//      if (widget.selectedAssetList.contains(assetEntity)) {
//        setState(() {
//          widget.selectedAssetList.remove(assetEntity);
//          print(widget.selectedAssetList);
//          assetEntity.file.then((value) {
//            print(value);
//            selectedAssetPathList.remove(value!);
//          });
//        });
//      } else if (widget.selectedAssetList.length < maxCount) {
//        setState(() {
//          widget.selectedAssetList.add(assetEntity);
//          assetEntity.file.then((value) {
//            print(value);
//            selectedAssetPathList.add(value!);
//          });
//          //selectedAssetPathList.add(assetPathEntity!);
//          print(widget.selectedAssetList);
//        });
//      }
//    }
// }
