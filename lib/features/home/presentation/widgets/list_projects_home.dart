import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:video_player/video_player.dart';

import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/database/db/operations_on_database.dart';
import '/core/utils/navigation.dart';
import '/core/widgets/custom_image.dart';
import '/core/widgets/loading.dart';

class ListProjectsHome extends StatefulWidget {
  const ListProjectsHome({super.key});

  @override
  State<ListProjectsHome> createState() => _ListProjectsHomeState();
}

class _ListProjectsHomeState extends State<ListProjectsHome> {
  final ValueNotifier<List<DatabaseModel>> _deleteDatabase =
      ValueNotifier<List<DatabaseModel>>([]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDatabaseData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _deleteDatabase.dispose();
  }

  void _loadDatabaseData() async {
    try {
      List<DatabaseModel> projects = await OperationsOnDatabase.readData();
      _deleteDatabase.value = projects;
    } catch (error) {
      _deleteDatabase.value = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "projects".tr(),
                style: AppTheme.headline,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print("space");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: AppColors.lightBlueAccent, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.cloud_upload,
                            color: AppColors.lightBlueAccent,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "space".tr(),
                            style: AppTheme.bodySmall.copyWith(
                              color: AppColors.lightBlueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print('Icons.edit_note');
                    },
                    icon: const Icon(
                      Icons.edit_note,
                      size: 30,
                    ),
                  )
                ],
              )
            ],
          ),
          SafeArea(
            child: ValueListenableBuilder(
              valueListenable: _deleteDatabase,
              builder: (context, value, child) {
                if (value.isNotEmpty) {
                  return _buildListOfProjects(value, context);
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImage.rectangle(
                        image: AppAssets.homePageListProjects,
                        isNetworkImage: false,
                        svg: false,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "your_project_will_appear_here".tr(),
                        style: AppTheme.headline6.copyWith(
                          color: AppColors.greyTest,
                        ),
                      ),
                      Text(
                        "start_create_now".tr(),
                        style: AppTheme.headline6.copyWith(
                          color: AppColors.greyTest,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildListOfProjects(List<DatabaseModel> list, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return _buildProjectCard(list, index, context);
      },
    );
  }

  _buildProjectCard(List<DatabaseModel> list, int index, BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    File file = File(list[index].assetFile!);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            FutureBuilder(
              future: initialVideoController(file: file),
              builder: (BuildContext context,
                  AsyncSnapshot<VideoPlayerController> snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    width: 45,
                    height: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: VideoPlayer(snapshot.data!),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const LoadingWidget();
                }
              },
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: size * 0.4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${list[index].name}",
                    style: AppTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${list[index].date}",
                    style:
                        AppTheme.bodySmall.copyWith(color: AppColors.greyTest),
                  ),
                  Text(
                    list[index].duration!.split(".").first,
                    style:
                        AppTheme.bodySmall.copyWith(color: AppColors.greyTest),
                  ),
                ],
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            _buildOperationsOnProjects(context, list[index].id!);
          },
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }

  Future<VideoPlayerController> initialVideoController(
      {required File file}) async {
    VideoPlayerController controller = VideoPlayerController.file(file);
    await controller.initialize();
    return controller;
  }

  _buildOperationsOnProjects(BuildContext context, int id) {
    return showDialog(
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60,
                color: AppColors.white,
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    OperationsOnDatabase.deleteData(id: id).then(
                      (value) {
                        showToast(
                          'your_project_has_been_delete_successfully'.tr(),
                          context: context,
                          animation: StyledToastAnimation.scale,
                          reverseAnimation: StyledToastAnimation.fade,
                          position: StyledToastPosition.center,
                          animDuration: const Duration(seconds: 1),
                          duration: const Duration(seconds: 4),
                          curve: Curves.elasticOut,
                          reverseCurve: Curves.linear,
                        );
                        Navigation.pop(context);
                        _loadDatabaseData();
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.delete,
                      ),
                      Text(
                        "delete".tr(),
                        style: AppTheme.headline.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// class ListProjectsHome extends StatefulWidget {
//   const ListProjectsHome({super.key});
//
//   @override
//   State<ListProjectsHome> createState() => _ListProjectsHomeState();
// }
//
// class _ListProjectsHomeState extends State<ListProjectsHome> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "projects".tr(),
//                 style: AppTheme.headline,
//               ),
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       print("space");
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(2),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(
//                             color: AppColors.lightBlueAccent, width: 1.5),
//                       ),
//                       child: Row(
//                         children: [
//                           const Icon(
//                             Icons.cloud_upload,
//                             color: AppColors.lightBlueAccent,
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             "space".tr(),
//                             style: AppTheme.bodySmall.copyWith(
//                               color: AppColors.lightBlueAccent,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       print('Icons.edit_note');
//                     },
//                     icon: const Icon(
//                       Icons.edit_note,
//                       size: 30,
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//           SafeArea(
//             child: FutureBuilder<List<DatabaseModel>>(
//               future: OperationsOnDatabase.readData(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   if (snapshot.data!.isNotEmpty) {
//                     return _buildListOfProjects(snapshot.data!, context);
//                   } else {
//                     return Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         CustomImage.rectangle(
//                           image: AppAssets.homePageListProjects,
//                           isNetworkImage: false,
//                           svg: false,
//                           width: 30,
//                           height: 30,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "your_project_will_appear_here".tr(),
//                           style: AppTheme.headline6.copyWith(
//                             color: AppColors.greyTest,
//                           ),
//                         ),
//                         Text(
//                           "start_create_now".tr(),
//                           style: AppTheme.headline6.copyWith(
//                             color: AppColors.greyTest,
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                 } else if (snapshot.hasError) {
//                   return Center(
//                     child: Text('Error: ${snapshot.error}'),
//                   );
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   _buildListOfProjects(List<DatabaseModel> list, BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: list.length,
//       itemBuilder: (context, index) {
//         return _buildProjectCard(list, index, context);
//       },
//     );
//   }
//
//   _buildProjectCard(List<DatabaseModel> list, int index, BuildContext context) {
//     double size = MediaQuery
//         .of(context)
//         .size
//         .width;
//     File file = File(list[index].assetFile!);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             FutureBuilder(
//               future: initialVideoController(file: file),
//               builder: (BuildContext context,
//                   AsyncSnapshot<VideoPlayerController> snapshot) {
//                 if (snapshot.hasData) {
//                   return SizedBox(
//                     width: 45,
//                     height: 45,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(15),
//                       child: VideoPlayer(snapshot.data!),
//                     ),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   return const LoadingWidget();
//                 }
//               },
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               width: size * 0.4,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "${list[index].name}",
//                     style: AppTheme.headline5,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   Text(
//                     "${list[index].date}",
//                     style:
//                     AppTheme.bodySmall.copyWith(color: AppColors.greyTest),
//                   ),
//                   Text(
//                     list[index].duration!.split(".").first,
//                     style:
//                     AppTheme.bodySmall.copyWith(color: AppColors.greyTest),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         IconButton(
//           onPressed: () {
//             _buildOperationsOnProjects(context, list[index].id!);
//           },
//           icon: const Icon(Icons.edit),
//         ),
//       ],
//     );
//   }
//
//   Future<VideoPlayerController> initialVideoController(
//       {required File file}) async {
//     VideoPlayerController controller = VideoPlayerController.file(file);
//     await controller.initialize();
//     return controller;
//   }
//
//
//   _buildOperationsOnProjects(BuildContext context, int id) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return Align(
//           alignment: Alignment.bottomCenter,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 height: 60,
//                 color: AppColors.white,
//                 width: double.infinity,
//                 child: InkWell(
//                   onTap: () {
//                     OperationsOnDatabase.deleteData(id: id).then(
//                           (value) {
//                         showToast(
//                           'your_project_has_been_delete_successfully'.tr(),
//                           context: context,
//                           animation: StyledToastAnimation.scale,
//                           reverseAnimation: StyledToastAnimation.fade,
//                           position: StyledToastPosition.center,
//                           animDuration: const Duration(seconds: 1),
//                           duration: const Duration(seconds: 4),
//                           curve: Curves.elasticOut,
//                           reverseCurve: Curves.linear,
//                         );
//
//                         /* EasyLoading.showToast(
//                         "your_project_has_been_delete_successfully".tr(),
//                         duration: const Duration(milliseconds: 600),
//                         maskType: EasyLoadingMaskType.black,
//                         toastPosition: EasyLoadingToastPosition.bottom,
//                       );*/
//                         Navigation.pop(context);
//                         setState(() {});
//                       },
//                     );
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Icon(
//                         Icons.delete,
//                       ),
//                       Text(
//                         "delete".tr(),
//                         style: AppTheme.headline.copyWith(
//                           color: AppColors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
