import 'package:flutter/material.dart';

import '/core/widgets/container_list_item.dart';
import '/features/edit_new_project/items_cubit/items_list_cubit.dart';
import '/features/edit_new_project/presentation/widgets/Icon_name.dart';
import '/features/filters_edit/presentation/widgets/filters_edit_items.dart';

class FiltersEdit extends StatelessWidget {
  FiltersEdit({
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
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              double size = MediaQuery.of(context).size.width;
              return IconName(
                onTap: () {
                  print("FiltersEdit index $index");
                },
                horizontal: size * 0.17,
                icon: FiltersEditItems
                    .filtersEditItemsList[index].filtersEditAssets!,
                name: FiltersEditItems
                    .filtersEditItemsList[index].filtersEditName!,
              );
            },
          ),
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
