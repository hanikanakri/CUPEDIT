import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/custom_text_rich.dart';
import '/core/widgets/loading.dart';
import '/features/edit_new_project/presentation/pages/picker_image_or_video.dart';
import '/features/edit_new_project/presentation/widgets/asset_widget_builder.dart';
import '/features/edit_new_project/presentation/widgets/media_services.dart';
import '/features/edit_new_project/presentation/widgets/selected_assets_list_view.dart';

class ImagePicker extends StatefulWidget {
  ImagePicker({
    super.key,
    required this.maxCount,
    required this.selectedAlbum,
    required this.albumList,
    required this.assetList,
    required this.selectedAssetList,
  });

  final int maxCount;
  AssetPathEntity? selectedAlbum;
  List<AssetPathEntity> albumList;
  List<AssetEntity> assetList;
  List<AssetEntity> selectedAssetList;

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  final RequestType requestType = RequestType.image;
  List<File> selectedAssetPathList = <File>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MediaServices().loadAlbums(requestType).then((value) {
      setState(() {
        widget.albumList = value;
        widget.selectedAlbum = value[0];
      });

      MediaServices().loadAssets(widget.selectedAlbum!).then((value) {
        setState(() {
          widget.assetList = value;
        });
      });
    });
    // _albumCount;
  }

  final ValueNotifier<bool> isDisplayingDetail = ValueNotifier<bool>(true);

  @override
  void dispose() {
    isDisplayingDetail.dispose();
    super.dispose();
  }

  void removeAsset(int index) {
    widget.selectedAssetList.removeAt(index);
    setState(() {});
  }

  void onResult(List<AssetEntity>? result) {
    if (result != null && result != widget.selectedAssetList) {
      widget.selectedAssetList = result.toList();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.albumList.isEmpty
        ? Center(
            child: Text(
              "there_is_no_images".tr(),
              style: AppTheme.headline.copyWith(
                color: AppColors.white,
              ),
            ),
          )
        : widget.assetList.isEmpty
            ? const Center(
                child: LoadingWidget(
                  color: AppColors.red,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.assetList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5.5,
                        mainAxisSpacing: 5.5,
                      ),
                      itemBuilder: (context, index) {
                        if (index < widget.assetList.length) {
                          // Add a null check for the index
                          AssetEntity assetEntity = widget.assetList[index];
                          final AssetEntity asset =
                              widget.assetList.elementAt(index);
                          return Stack(
                            children: [
                              ValueListenableBuilder<bool>(
                                valueListenable: isDisplayingDetail,
                                builder: (_, bool value, __) => GestureDetector(
                                  onTap: () async {
                                    if (value) {
                                      final List<AssetEntity>? result =
                                          await AssetPickerViewer.pushToViewer(
                                        context,
                                        currentIndex: index,
                                        previewAssets: widget.assetList,
                                        themeData:
                                            AssetPicker.themeData(Colors.white),
                                        //themeData: AssetPicker.themeData(themeColor),
                                      );
                                      onResult(result);
                                    }
                                  },
                                  child: RepaintBoundary(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: AssetWidgetBuilder(
                                        entity: asset,
                                        isDisplayingDetail: value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () => selectedAssets(
                                        assetEntity: assetEntity),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        width: 22.5,
                                        height: 22.5,
                                        decoration: BoxDecoration(
                                          color: widget.selectedAssetList
                                                      .contains(assetEntity) ==
                                                  true
                                              ? AppColors.blue
                                              : AppColors.black12,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.white,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${widget.selectedAssetList.indexOf(assetEntity) + 1}",
                                            style: AppTheme.bodySmall.copyWith(
                                              color: widget.selectedAssetList
                                                          .contains(
                                                              assetEntity) ==
                                                      true
                                                  ? AppColors.white
                                                  : AppColors.transparent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  /*Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.assetList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5.5,
                    mainAxisSpacing: 5.5,
                  ),
                  itemBuilder: (context, index) {
                    if (index < widget.assetList.length) {
                      // Add a null check for the index
                      AssetEntity assetEntity = widget.assetList[index];
                      return Padding(
                        padding: const EdgeInsets.all(2),
                        child: assetWidget(assetEntity),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),*/
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SelectedAssetsListView(
                      assets: widget.selectedAssetList,
                      isDisplayingDetail: isDisplayingDetail,
                      onResult: onResult,
                      onRemoveAsset: removeAsset,
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 2.5),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: widget.selectedAssetList.isEmpty
                              ? AppColors.grey
                              : AppColors.green,
                        ),
                        child: InkWell(
                          onTap: () async {
                            if (widget.selectedAssetList.isNotEmpty) {
                              for (AssetEntity asset
                                  in widget.selectedAssetList) {
                                File? path = await asset.file;
                                if (path != null) {
                                  print(path.path);

                                  ///TODO
                                  print('Selected Asset Path: $path');
                                }
                              }
                            }
                          },
                          child: CustomTextRich(
                            mainText: "add",
                            secondText: widget.selectedAssetList.isEmpty
                                ? ""
                                : " (${widget.selectedAssetList.length})",
                            secondStyle: AppTheme.headline
                                .copyWith(color: AppColors.white),
                            mainStyle: AppTheme.headline
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  /* Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.selectedAssetList.isNotEmpty)
                      AnimatedContainer(
                        height: widget.selectedAssetList.isNotEmpty ? 80 : 0,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          color: AppColors.grey8,
                        ),
                        duration: const Duration(
                          seconds: 1,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.selectedAssetList.length,
                          itemBuilder: (context, index) {
                            AssetEntity assetEntity =
                                widget.selectedAssetList[index];
                            return Container(
                              width: 50,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Stack(
                                children: [
                                  CustomImage.rectangle(
                                    image: selectedAssetPathList[index],
                                    svg: false,
                                    fit: BoxFit.fill,
                                    cornerRadius: 12,
                                    width: 50,
                                    isNetworkImage: false,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        widget.selectedAssetList.removeWhere(
                                            (item) => item == assetEntity);
                                        assetEntity.file.then((value) {
                                          selectedAssetPathList.remove(value!);
                                        });
                                      });
                                    },
                                    child: Container(
                                      alignment:
                                          SharedStorage.getLanguage() == "en"
                                              ? Alignment.topRight
                                              : Alignment.topLeft,
                                      child: const Icon(
                                        Icons.remove_circle_outline,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    const Divider(
                      color: AppColors.white,
                      thickness: 0.5,
                      height: 0.0,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColors.grey8,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.black12,
                            ),
                            child: CustomTextRich(
                              mainText: "add",
                              secondText: widget.selectedAssetList.isEmpty
                                  ? ""
                                  : " (${widget.selectedAssetList.length})",
                              secondStyle: AppTheme.headline,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),*/
                ],
              );
  }

  Widget assetWidget(AssetEntity assetEntity) {
    return InkWell(
      onTap: () {
        AnimationNavigation.scalePush(
          context,
          PickerImageOrVideo(
            assetEntity: assetEntity,
          ),
        );
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(
              widget.selectedAssetList.contains(assetEntity) == true ? 8 : 0,
            ),
            child: AssetEntityImage(
              assetEntity,
              isOriginal: false,
              filterQuality: FilterQuality.high,
              thumbnailSize: const ThumbnailSize.square(250),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.error,
                    color: AppColors.red,
                  ),
                );
              },
            ),
          ),
          if (assetEntity.type == AssetType.video)
            const Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    Icons.video_call,
                    color: AppColors.red,
                  ),
                ),
              ),
            ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => selectedAssets(assetEntity: assetEntity),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 22.5,
                    height: 22.5,
                    decoration: BoxDecoration(
                      color:
                          widget.selectedAssetList.contains(assetEntity) == true
                              ? AppColors.blue
                              : AppColors.black12,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.white,
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "${widget.selectedAssetList.indexOf(assetEntity) + 1}",
                        style: AppTheme.bodySmall.copyWith(
                          color:
                              widget.selectedAssetList.contains(assetEntity) ==
                                      true
                                  ? AppColors.white
                                  : AppColors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void selectedAssets({required AssetEntity assetEntity}) {
    if (widget.selectedAssetList.contains(assetEntity)) {
      setState(() {
        widget.selectedAssetList.remove(assetEntity);
        print(widget.selectedAssetList);
        assetEntity.file.then((value) {
          print(value);
          selectedAssetPathList.remove(value!);
        });
      });
    } else if (widget.selectedAssetList.length < widget.maxCount) {
      setState(() {
        widget.selectedAssetList.add(assetEntity);
        assetEntity.file.then((value) {
          print(value);
          selectedAssetPathList.add(value!);
        });
        //selectedAssetPathList.add(assetPathEntity!);
        print(widget.selectedAssetList);
      });
    }
  }
}
