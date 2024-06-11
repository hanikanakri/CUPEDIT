import 'package:flutter/material.dart';

import '/core/widgets/container_list_item.dart';
import '/features/edit_new_project/items_cubit/items_list_cubit.dart';
import '/features/edit_new_project/presentation/widgets/Icon_name.dart';
import '/features/effects_edit/presentation/widgets/effects_edit_items.dart';

class EffectsEdit extends StatelessWidget {
  EffectsEdit({
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
                onTap: () {},
                horizontal: size * 0.0588,
                name: EffectsEditItems
                    .textEditItemsList[index].effectsEditItemsName!,
                icon: EffectsEditItems
                    .textEditItemsList[index].effectsEditItemsAssets!,
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
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          int adjustedIndex = index5(index);
          return IconName(
            onTap: () {
              if (index == 0) {
                itemsListCubit?.switchToBase();
              }
            },
            index: index,
            icon: EffectsEditItems
                .textEditItemsList[adjustedIndex].effectsEditItemsName!,
            name: index == 0
                ? ""
                : EffectsEditItems
                    .textEditItemsList[adjustedIndex].effectsEditItemsAssets!,
          );
        },
      ),
    );
  }

  int index5(int index) {
    if (index < 5) {
      return index + 1;
    } else {
      return 5;
    }
  }*/
}
