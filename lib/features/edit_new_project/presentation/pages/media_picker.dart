// import 'package:flutter/material.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';
//
// import '/features/edit_new_project/presentation/widgets/media_services.dart';
//
// class MediaPicker extends StatefulWidget {
//    MediaPicker({
//     super.key,
//     required this.maxCount,
//     required this.requestType,
//     required this.selectedAssetList,
//     required this.assetList,
//     required this.albumList,
//     required this.selectedAlbum,
//   });
//
//   final int maxCount;
//   final RequestType requestType;
//   AssetPathEntity? selectedAlbum;
//   List<AssetPathEntity> albumList;
//   List<AssetEntity> assetList ;
//   List<AssetEntity> selectedAssetList;
//
//   @override
//   State<MediaPicker> createState() => _MediaPickerState();
// }
//
// class _MediaPickerState extends State<MediaPicker> {
// /*  AssetPathEntity? selectedAlbum;
//   List<AssetPathEntity> albumList = [];
//   List<AssetEntity> assetList = [];
//   List<AssetEntity> selectedAssetList = [];*/
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     MediaServices().loadAlbums(widget.requestType).then((value) {
//       setState(() {
//         widget.albumList = value;
//         widget.selectedAlbum = value[0];
//       });
//
//       MediaServices().loadAssets(widget.selectedAlbum!).then((value) {
//         setState(() {
//           widget.assetList = value;
//         });
//       });
//     });
//     // _albumCount;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           title: DropdownButton<AssetPathEntity>(
//             value: widget.selectedAlbum,
//             onChanged: (AssetPathEntity? value) {
//               setState(() {
//                 widget.selectedAlbum = value;
//               });
//               MediaServices().loadAssets(widget.selectedAlbum!).then((value) {
//                 setState(() {
//                   widget.assetList = value;
//                 });
//               });
//             },
//             items: widget.albumList.map<DropdownMenuItem<AssetPathEntity>>(
//                   (AssetPathEntity e) {
//                 return DropdownMenuItem<AssetPathEntity>(
//                   value: e,
//                   child: FutureBuilder<int>(
//                     future: e.assetCountAsync,
//                     builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Text("${e.name} Loading...");
//                       }
//                       if (snapshot.hasData) {
//                         return Text("${e.name} ${snapshot.data}");
//                       }
//                       return Text("${e.name} Error");
//                     },
//                   ),
//                 );
//               },
//             ).toList(),
//           ),
//           actions: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context, widget.selectedAssetList);
//               },
//               child: const Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                     right: 15,
//                   ),
//                   child: Text("ok"),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: widget.assetList.isEmpty
//             ? const Center(
//           child: CircularProgressIndicator(),
//         )
//             : GridView.builder(
//           physics: const BouncingScrollPhysics(),
//           itemCount: widget.assetList.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3),
//           itemBuilder: (context, index) {
//             AssetEntity assetEntity = widget.assetList[index];
//             return Padding(
//               padding: const EdgeInsets.all(2),
//               child: assetWidget(assetEntity),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget assetWidget(AssetEntity assetEntity) {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: Padding(
//             padding: EdgeInsets.all(
//               widget.selectedAssetList.contains(assetEntity) == true ? 8 : 0,
//             ),
//             child: AssetEntityImage(
//               assetEntity,
//               isOriginal: false,
//               thumbnailSize: const ThumbnailSize.square(250),
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return const Center(
//                   child: Icon(
//                     Icons.error,
//                     color: Colors.red,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         if (assetEntity.type == AssetType.video)
//           const Positioned.fill(
//             child: Align(
//               alignment: Alignment.bottomRight,
//               child: Padding(
//                 padding: EdgeInsets.all(12),
//                 child: Icon(
//                   Icons.video_call,
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//           ),
//         Positioned.fill(
//           child: Align(
//             alignment: Alignment.topRight,
//             child: GestureDetector(
//               onTap: () => selectedAssets(assetEntity:assetEntity),
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: widget.selectedAssetList.contains(assetEntity) == true
//                         ? Colors.blue
//                         : Colors.black12,
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: Colors.white,
//                       width: 1.5,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Text(
//                       "${widget.selectedAssetList.indexOf(assetEntity) + 1}",
//                       style: TextStyle(
//                         color: widget.selectedAssetList.contains(assetEntity) == true
//                             ? Colors.white
//                             : Colors.transparent,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   selectedAssets({required AssetEntity assetEntity}) {
//     if(widget.selectedAssetList.contains(assetEntity)){
//       setState(() {
//         widget.selectedAssetList.remove(assetEntity);
//       });
//     }else if(widget.selectedAssetList.length < widget.maxCount){
//       setState(() {
//         widget.selectedAssetList.add(assetEntity);
//       });
//     }
//   }
// }
