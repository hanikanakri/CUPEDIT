import 'package:flutter/material.dart';

import '/core/widgets/container_list_item.dart';
import '/features/edit_edit/presentation/widgets/edit_edit_items.dart';
import '/features/edit_new_project/items_cubit/items_list_cubit.dart';
import '/features/edit_new_project/presentation/widgets/Icon_name.dart';

class EditEdit extends StatelessWidget {
  EditEdit({
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
            itemCount: 29,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return IconName(
                onTap: () {
                  print("EditEdit  index $index");
                },
                icon:
                    EditEditItems.editEditItemsList[index].editEditItemsAssets!,
                name: EditEditItems.editEditItemsList[index].editEditItemsName!,
              );
            },
          ),
        ),
        //itemList(context),
      ],
    );
  }

/*  Widget itemList(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Container(
      height: size * 0.07,
      padding: const EdgeInsets.only(top: 5),
      color: AppColors.black,
      child: ListView.builder(
        itemCount: 30,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return IconName(
            onTap: () {
              print("EditEdit index $index");

              if (index == 0) {
                itemsListCubit?.switchToBase();
              }
            },
            icon: ItemsName.listOfItems[index].nameAssets!,
            name: index == 0 ? "" : ItemsName.listOfItems[index].nameItem!,
          );
        },
      ),
    );
  }*/
}
