import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/utils/shared_storage.dart';
import '/features/edit_new_project/items_cubit/items_list_cubit.dart';

class ContainerListItem extends StatelessWidget {
  const ContainerListItem({
    super.key,
    required this.itemsListCubit,
    required this.childList,
  });

  final Widget childList;
  final ItemsListCubit itemsListCubit;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Container(
      height: size * 0.07,
      padding: const EdgeInsets.only(top: 5),
      color: AppColors.black,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: SharedStorage.getLanguage() == "en" ? 35.0 : 0.0,
              right: SharedStorage.getLanguage() == "ar" ? 35.0 : 0.0,
            ),
            child: childList,
          ),
          ListBack(
            onPressed: () {
              itemsListCubit.switchToBase();
            },
          ),
        ],
      ),
    );
  }
}

class ListBack extends StatelessWidget {
  const ListBack({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: 33,
      //padding: const EdgeInsets.symmetric(horizontal: 50),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.grey,
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            SharedStorage.getLanguage() == "en"
                ? Icons.arrow_back_ios
                : Icons.arrow_forward_ios,
          ),
        ),
      ),
    );
  }
}
