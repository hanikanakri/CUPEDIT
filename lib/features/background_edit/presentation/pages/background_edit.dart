import 'package:flutter/material.dart';

import '/core/widgets/container_list_item.dart';
import '/features/background_edit/presentation/widgets/background_edit_items.dart';
import '/features/edit_new_project/items_cubit/items_list_cubit.dart';
import '/features/edit_new_project/presentation/widgets/Icon_name.dart';

class BackgroundEdit extends StatelessWidget {
  BackgroundEdit({
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
          childList: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              double size = MediaQuery.of(context).size.width;
              return IconName(
                onTap: () {
                  print("BackgroundEdit index $index");
                },
                horizontal: size * 0.1,
                icon: BackgroundEditItems
                    .backgroundEditItemsList[index].backgroundEditItemsAssets!,
                name: BackgroundEditItems
                    .backgroundEditItemsList[index].backgroundEditItemsName!,
              );
            },
          ),
        ),
        //itemList(context),
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
