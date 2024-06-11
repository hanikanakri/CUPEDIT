import 'package:app_settings/app_settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:permission_handler/permission_handler.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/custom_image.dart';
import '/features/edit_new_project/presentation/pages/new_project_page.dart';
import '/features/home/presentation/widgets/general_home_page_scaffold.dart';
import '/features/home/presentation/widgets/grid_tranzlation_and_icons.dart';
import '/features/home/presentation/widgets/home_new_project_card.dart';
import '/features/home/presentation/widgets/list_projects_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralHomePageScaffold(
      index: 1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...[
                GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 25,
                    mainAxisExtent: 100,
                  ),
                  itemCount: GridItemTranslation.grid.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildFuietureWidgetItem(
                      GridItemTranslation.grid[index].text!,
                      GridItemTranslation.grid[index].assets!,
                      onTap: () {
                        print(index);
                      },
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    
                    //  _requestStoragePermission();
                  },
                  child: Text(
                    'press_and_drag_to_reorder'.tr(),
                    style: AppTheme.bodySmall.copyWith(color: AppColors.black),
                  ),
                ),
                SafeArea(
                  child: HomeNewProjectCard(
                    onTap: () {
                      _requestStoragePermission(
                              context) /*.then((value) {
                        AnimationNavigation.slidePush(
                          context,
                          const NewProjectPage(),
                        );
                      })*/
                          ;
                    },
                  ),
                ),
                const ListProjectsHome(),
              ].expand(
                (element) => [
                  element,
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _requestStoragePermission(BuildContext context) async {
  PermissionStatus status = await Permission.storage.request();

  if (status.isGranted) {
    // The permission has been granted
    print('Storage permission granted!');
    AnimationNavigation.slidePush(
      context,
      const NewProjectPage(),
    );
  } else if (status.isDenied) {
    // The user has denied the permission
    print('Storage permission denied. Requesting again...');
    // Request the permission again
    status = await Permission.storage.request();
    if (status.isGranted) {
      print('Storage permission granted!');
    } else if (status.isPermanentlyDenied) {
      print(
          'Storage permission permanently denied. You need to go to app settings to grant the permission.');
      showToast(
        'Storage_permission_permanently_denied_You_need_to_go_to_app_settings_to_grant_the_permission'.tr(),
        context: context,
        animation: StyledToastAnimation.scale,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.center,
        animDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
      );
    } else {
      print('Storage permission denied or not granted yet.');
    }
  } else if (status.isPermanentlyDenied) {
    // The user has permanently denied the permission
    print(
        'Storage permission permanently denied. You need to go to app settings to grant the permission.');

    AppSettings.openAppSettings(
      type: AppSettingsType.settings,
    );
  } else {
    // The permission has been denied or the user has not yet decided
    print('Storage permission denied or not granted yet.');
  }
}

/*void _selectAssetsType(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const SelectAssetsType(),
  );
}*/

Widget _buildFuietureWidgetItem(String title, String imagePath,
    {void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: CustomImage.rectangle(
                  image: imagePath,
                  svg: false,
                  isNetworkImage: false,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: AppTheme.bodySmall.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
