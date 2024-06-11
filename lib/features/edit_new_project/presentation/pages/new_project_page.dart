import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/custom_image.dart';
import '/core/widgets/text_switch.dart';
import '/features/edit_new_project/presentation/pages/image_picker.dart';
import '/features/edit_new_project/presentation/pages/vedio_picker.dart';
import '/features/edit_new_project/presentation/widgets/general_new_project_scaffold.dart';
import '/features/edit_new_project/presentation/widgets/media_services.dart';

class NewProjectPage extends StatefulWidget {
  const NewProjectPage({super.key});

  @override
  State<NewProjectPage> createState() => _NewProjectPageState();
}

class _NewProjectPageState extends State<NewProjectPage> {
  int index = 1;
  int currentActiveSection = 1;

  //int currentAppBar = 1;
  bool isVideo = true;

  late final MediaServices _mediaServices = MediaServices();

  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }


  void _loadAlbums() {
    _mediaServices.loadAlbums(RequestType.video).then((value) {
      albumListVideo = value;
      selectedAlbumVideo = value[0];
      _loadAssets(selectedAlbumVideo!);
    });

    _mediaServices.loadAlbums(RequestType.image).then((value) {
      albumListImage = value;
      selectedAlbumImage = value[0];
      _loadAssets(selectedAlbumImage!);
    });
  }

  void _loadAssets(AssetPathEntity selectedAlbum) {
    _mediaServices.loadAssets(selectedAlbum).then((value) {
      if (mounted) {
        setState(() {
          if (selectedAlbum == selectedAlbumVideo) {
            assetListVideo = value;
          } else {
            assetListImage = value;
          }
        });
      }
    });
  }




  int? maxVideoCount = 10;
  int? maxImageCount = 10;



  AssetPathEntity? selectedAlbumVideo;
  List<AssetPathEntity> albumListVideo = <AssetPathEntity>[];
  List<AssetEntity> assetListVideo = <AssetEntity>[];
  List<AssetEntity> selectedAssetListVideo = <AssetEntity>[];

  AssetPathEntity? selectedAlbumImage;
  List<AssetPathEntity> albumListImage = <AssetPathEntity>[];
  List<AssetEntity> assetListImage = <AssetEntity>[];
  List<AssetEntity> selectedAssetListImage = <AssetEntity>[];

  @override
  Widget build(BuildContext context) {
    return GeneralNewProjectScaffold(
      body: SafeArea(
        child: Column(
          children: [
            ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                        [selectedAssetListVideo, selectedAssetListImage],
                      );
                    },
                    child: CustomImage.circular(
                      image: AppAssets.cancelNewProject,
                      isNetworkImage: false,
                      color: AppColors.white,
                      radius: 18,
                    ),
                  ),
                  DropdownButton<AssetPathEntity>(
                    value: currentActiveSection == 1
                        ? selectedAlbumVideo
                        : selectedAlbumImage,
                    dropdownColor: AppColors.black,
                    style: AppTheme.headline.copyWith(color: AppColors.white),
                    onChanged: (AssetPathEntity? value) {
                      setState(() {
                        currentActiveSection == 1
                            ? selectedAlbumVideo = value
                            : selectedAlbumImage = value;
                      });
                      MediaServices()
                          .loadAssets(currentActiveSection == 1
                              ? selectedAlbumVideo!
                              : selectedAlbumImage!)
                          .then((value) {
                        setState(() {
                          currentActiveSection == 1
                              ? assetListVideo = value
                              : assetListImage = value;
                        });
                      });
                    },
                    items: currentActiveSection == 1
                        ? albumListVideo.map<DropdownMenuItem<AssetPathEntity>>(
                            (AssetPathEntity e) {
                              return DropdownMenuItem<AssetPathEntity>(
                                value: e,
                                child: FutureBuilder<int>(
                                  future: e.assetCountAsync,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<int> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("${e.name} Loading...");
                                    }
                                    if (snapshot.hasData) {
                                      return Text(
                                          "${e.name} (${snapshot.data})");
                                    }
                                    return Text("${e.name} Error");
                                  },
                                ),
                              );
                            },
                          ).toList()
                        : albumListImage.map<DropdownMenuItem<AssetPathEntity>>(
                            (AssetPathEntity e) {
                              return DropdownMenuItem<AssetPathEntity>(
                                value: e,
                                child: FutureBuilder<int>(
                                  future: e.assetCountAsync,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<int> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("${e.name} Loading...");
                                    }
                                    if (snapshot.hasData) {
                                      return Text(
                                          "${e.name} (${snapshot.data})");
                                    }
                                    return Text("${e.name} Error");
                                  },
                                ),
                              );
                            },
                          ).toList(),
                  ),
                  _buildRowIcon(
                    "library",
                    3,
                    isIcon: false,
                    onTap: () {
                      setState(() {
                        index = 3;
                      });
                    },
                  ),
                  const SizedBox(),
                ],
              ),
              Divider(
                color: AppColors.grey,
              ),
              TextSwitch(
                firstText: 'videos'.tr(),
                secondText: 'images'.tr(),
                isFirstSelected: currentActiveSection == 1,
                onPressFirst: () {
                  setState(() {
                    currentActiveSection = 1;
                    print(currentActiveSection);
                  });
                },
                onPressSecond: () {
                  setState(() {
                    currentActiveSection = 2;
                    print(currentActiveSection);
                  });
                },
              ),
              if (currentActiveSection == 1)
                Expanded(
                  child: VideoPicker(
                    maxCount: maxVideoCount!,
                    selectedAlbum: selectedAlbumVideo,
                    albumList: albumListVideo,
                    assetList: assetListVideo,
                    selectedAssetList: selectedAssetListVideo,
                  ),
                )
              else
                Expanded(
                  child: ImagePicker(
                    maxCount: maxImageCount!,
                    selectedAlbum: selectedAlbumImage,
                    albumList: albumListImage,
                    assetList: assetListImage,
                    selectedAssetList: selectedAssetListImage,
                  ),
                ),
            ].expand(
              (element) => [
                element,
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildRowIcon(String text, int indexColor,
      {bool isIcon = true, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            text.tr(),
            style: AppTheme.headline.copyWith(
              color: index == indexColor ? AppColors.white : AppColors.grey,
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          if (isIcon == true)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: index == indexColor ? AppColors.white : AppColors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: index == indexColor ? AppColors.black : AppColors.black,
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
