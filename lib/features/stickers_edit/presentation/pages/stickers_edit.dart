import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/features/edit_new_project/items_cubit/items_list_cubit.dart';
import '/features/edit_new_project/presentation/widgets/Icon_name.dart';

class StickersEdit extends StatelessWidget {
  StickersEdit({
    super.key,
    this.itemsListCubit,
  });

  ItemsListCubit? itemsListCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        itemList(context),
      ],
    );
  }

  Widget itemList(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Container(
      height: size * 0.07,
      padding: const EdgeInsets.only(top: 5),
      color: AppColors.black,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return IconName(
            onTap: () {
              if (index == 0) {
                itemsListCubit?.switchToBase();
              }
            },
            icon: ItemsName.listOfItems[index].nameAssets!,
            name: ItemsName.listOfItems[index].nameItem!,
          );
        },
      ),
    );
  }
}
