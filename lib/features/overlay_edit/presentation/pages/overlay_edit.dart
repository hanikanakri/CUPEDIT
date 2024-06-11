import 'package:flutter/material.dart';

import '/core/widgets/container_list_item.dart';
import '/features/edit_new_project/items_cubit/items_list_cubit.dart';
import '/features/overlay_edit/presentation/widgets/add_overlay_button.dart';

class OverLayEdit extends StatelessWidget {
  OverLayEdit({
    super.key,
    this.itemsListCubit,
  });

  ItemsListCubit? itemsListCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerListItem(
          itemsListCubit: itemsListCubit!,
          childList: const AddOverlayButton(),
        ),
        // itemList(context),
      ],
    );
  }

/*
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
            index: index,
            icon: ItemsName.listOfItems[index].nameAssets!,
            name: index == 0 ? "" : ItemsName.listOfItems[index].nameItem!,
          );
        },
      ),
    );
  }
*/
}
