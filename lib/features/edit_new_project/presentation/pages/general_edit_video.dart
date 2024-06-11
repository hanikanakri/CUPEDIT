import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:video_editor/video_editor.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';
import '/core/widgets/loading.dart';
import '/features/adjust_edit/presentation/pages/adjust_edit.dart';
import '/features/aspect_ratio_edit/presentation/pages/aspect_ratio_edit.dart';
import '/features/audio_edit/presentation/pages/audio_edit.dart';
import '/features/background_edit/presentation/pages/background_edit.dart';
import '/features/edit_edit/presentation/pages/edit_edit.dart';
import '/features/edit_new_project/items_cubit/items_list_cubit.dart';
import '/features/edit_new_project/items_cubit/media_process_cubit.dart';
import '/features/edit_new_project/items_cubit/media_process_state.dart';
import '/features/edit_new_project/presentation/widgets/Icon_name.dart';
import '/features/edit_new_project/presentation/widgets/general_new_project_scaffold.dart';
import '/features/effects_edit/presentation/pages/effects_edit.dart';
import '/features/filters_edit/presentation/pages/filters_edit.dart';
import '/features/home/presentation/pages/homeScreen.dart';
import '/features/merge_videos/presentation/pages/merge_video_page.dart';
import '/features/overlay_edit/presentation/pages/overlay_edit.dart';
import '/features/stickers_edit/presentation/pages/stickers_edit.dart';
import '/features/text_edit/presentation/pages/Text_edit.dart';

class GeneralEditVideos extends StatefulWidget {
  const GeneralEditVideos({
    super.key,
    // this.file,
    // this.totalVideoDuration,
  });

  // final int? totalVideoDuration;
  // final File? file;

  @override
  State<GeneralEditVideos> createState() => _GeneralEditVideosState();
}

class _GeneralEditVideosState extends State<GeneralEditVideos> {
  ItemsListCubit? itemsListCubit;
  MediaProcessCubit? mediaProcessCubit;

  @override
  void initState() {
    super.initState();
    mediaProcessCubit = MediaProcessCubit();
    itemsListCubit = ItemsListCubit();
  }

  @override
  void dispose() {
    mediaProcessCubit!.close();
    itemsListCubit!.close();
    super.dispose();
  }

  bool popScope = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaProcessCubit, MediaProcessState>(
      bloc: mediaProcessCubit,
      builder: (context, state) {
        if (state is InitialProcessMediaProcessState ||
            !mediaProcessCubit!.controller.initialized) {
          return const LoadingWidget();
        } else {
          return PopScope(
            canPop: popScope,
            onPopInvoked: (didPop) {
              setState(() {});
              showToast(
                'your_project_has_been_saved_successfully'.tr(),
                context: context,
                animation: StyledToastAnimation.scale,
                reverseAnimation: StyledToastAnimation.fade,
                position: StyledToastPosition.center,
                animDuration: const Duration(seconds: 1),
                duration: const Duration(seconds: 4),
                curve: Curves.elasticOut,
                reverseCurve: Curves.linear,
              );

              AnimationNavigation.fadePushAndRemoveUntil(
                context,
                const HomeScreen(),
              );
            },
            child: GeneralNewProjectScaffold(
              index: 0,
              body: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            //  height: MediaQuery.of(context).size.height*0.5,
                            child: AspectRatio(
                              aspectRatio: 9 / 16,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                ),
                                child: CropGridViewer.preview(
                                  controller: mediaProcessCubit!.controller,
                                ),
                              ),
                            ),
                          ),
                          AnimatedBuilder(
                            animation: mediaProcessCubit!.controller.video,
                            builder: (_, __) => AnimatedOpacity(
                              opacity: mediaProcessCubit!.controller.isPlaying
                                  ? 0
                                  : 1,
                              duration: kThemeAnimationDuration,
                              child: GestureDetector(
                                onTap: mediaProcessCubit!.controller.video.play,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<ItemsListCubit, ListViewType>(
                    bloc: itemsListCubit,
                    builder: (context, state) {
                      return SizedBox(
                        height: 200,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left:
                                SharedStorage.getLanguage() == "en" ? 10.0 : 0,
                            right:
                                SharedStorage.getLanguage() == "ar" ? 10.0 : 0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //mainAxisSize: MainAxisSize.min,
                            children: _trimSlider(),
                          ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<ItemsListCubit, ListViewType>(
                    bloc: itemsListCubit,
                    builder: (context, ListViewType currentItemsListState) {
                      switch (currentItemsListState) {
                        case ListViewType.base:
                          return itemListBase(context);

                        case ListViewType.list1:
                          return EditEdit(
                            itemsListCubit: itemsListCubit,
                          );

                        case ListViewType.list2:
                          return AudioEdit(
                            itemsListCubit: itemsListCubit,
                          );

                        case ListViewType.list3:
                          return TextEdit(
                            itemsListCubit: itemsListCubit,
                            popScope: (value) {
                              popScope = value;
                              setState(() {});
                            },
                          );

                        case ListViewType.list4:
                          return OverLayEdit(
                            itemsListCubit: itemsListCubit,
                          );

                        case ListViewType.list5:
                          return EffectsEdit(
                            itemsListCubit: itemsListCubit,
                          );

                        case ListViewType.list6:
                          return AspectRatioEdit(
                            itemsListCubit: itemsListCubit,
                          );

                        case ListViewType.list7:
                          return FiltersEdit(
                            itemsListCubit: itemsListCubit,
                          );

                        case ListViewType.list8:
                          return AdjustEdit(
                            itemsListCubit: itemsListCubit,
                          );

                        case ListViewType.list9:
                          return StickersEdit(
                            itemsListCubit: itemsListCubit,
                          );

                        case ListViewType.list10:
                          return BackgroundEdit(
                            itemsListCubit: itemsListCubit,
                          );

                        default:
                          return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: Listenable.merge(
          [
            mediaProcessCubit!.controller,
            mediaProcessCubit!.controller.video,
          ],
        ),
        builder: (_, __) {
          final int duration =
              mediaProcessCubit!.controller.videoDuration.inSeconds;
          final double pos =
              mediaProcessCubit!.controller.trimPosition * duration;
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: mediaProcessCubit!.height / 4),
            child: Row(
              children: [
                Text(
                  mediaProcessCubit!.formatter(
                    Duration(
                      seconds: pos.toInt(),
                    ),
                  ),
                  style: AppTheme.bodySmall.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const Spacer(),
                AnimatedOpacity(
                  opacity: mediaProcessCubit!.controller.isTrimming ? 1 : 0,
                  duration: kThemeAnimationDuration,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        mediaProcessCubit!.formatter(
                          mediaProcessCubit!.controller.startTrim,
                        ),
                        style:
                            AppTheme.bodySmall.copyWith(color: AppColors.white),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        mediaProcessCubit!
                            .formatter(mediaProcessCubit!.controller.endTrim),
                        style:
                            AppTheme.bodySmall.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setVolume(mediaProcessCubit!.controller);
                  },
                  icon: Icon(
                    isVolumeMute == true ? Icons.volume_mute : Icons.volume_up,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    mergeVideos(context);
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin:
                  EdgeInsets.symmetric(vertical: mediaProcessCubit!.height / 4),
              child: TrimSlider(
               // hasHaptic: false,

                scrollController: ScrollController(
                  onAttach: (position) {
                    print(position);
                  },
                  initialScrollOffset: 15.5,
               //   keepScrollOffset: false,
                  onDetach: (position) {
                    print(position);
                  },
                ),
                controller: mediaProcessCubit!.controller,
                height: mediaProcessCubit!.height,
                horizontalMargin: mediaProcessCubit!.height / 4,
                child: Container(
                  decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.circular(50),
                      ),
                  child: TrimTimeline(
                    controller: mediaProcessCubit!.controller,
                    padding: const EdgeInsets.only(top: 10),
                    textStyle: AppTheme.bodySmall.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget itemListBase(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size * 0.07,
        margin: const EdgeInsets.only(top: 5),
        color: AppColors.transparent,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return IconName(
              onTap: () {
                print(index);
                switch (index) {
                  case 0:
                    print(" =============switchToList Edit===========");
                    itemsListCubit!.switchToList1();
                    break;

                  case 1:
                    print(" =============switchToList audio===========");
                    itemsListCubit!.switchToList2();
                    break;

                  case 2:
                    print(" =============switchToList Text===========");
                    itemsListCubit!.switchToList3();
                    break;

                  case 3:
                    print(" =============switchToList overlay===========");
                    itemsListCubit!.switchToList4();
                    break;

                  case 4:
                    print(
                        " =============switchToList effects edit_edit===========");
                    itemsListCubit!.switchToList5();
                    break;

                  case 5:
                    print(" =============switchToList aspect ratio===========");
                    itemsListCubit!.switchToList6();
                    break;

                  case 6:
                    print(" =============switchToList filters===========");
                    itemsListCubit!.switchToList7();
                    break;

                  case 7:
                    print(" =============switchToList adjust===========");
                    itemsListCubit!.switchToList8();
                    break;

                  case 8:
                    print(" =============switchToList stickers===========");
                    itemsListCubit!.switchToList9();
                    break;

                  case 9:
                    print(" =============switchToList background===========");
                    itemsListCubit!.switchToList10();
                    break;
                }
              },
              icon: ItemsName.listOfItems[index].nameAssets!,
              name: ItemsName.listOfItems[index].nameItem!,
            );
          },
        ),
      ),
    );
  }

  int volumeMute = 100;
  bool isVolumeMute = false;

  void setVolume(VideoEditorController controller) {
    print("===============volume_mute===============");
    if (volumeMute == 100) {
      controller.video.setVolume(0);
      volumeMute = 0;
      isVolumeMute = true;
      setState(() {});
    } else if (volumeMute == 0) {
      controller.video.setVolume(100);
      volumeMute = 100;
      isVolumeMute = false;
      setState(() {});
    }
  }

  Future mergeVideos(BuildContext context) {
    print("===============merge_video===============");
    return showModalBottomSheet(
      context: context,
      builder: (context) => const MergeVideosPage(),
    );
  }
}
