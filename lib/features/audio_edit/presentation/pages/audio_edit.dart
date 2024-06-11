import 'package:flutter/material.dart';

import '/core/widgets/container_list_item.dart';
import '/features/audio_edit/presentation/widgets/audio_items.dart';
import '/features/edit_new_project/items_cubit/items_list_cubit.dart';
import '/features/edit_new_project/presentation/widgets/Icon_name.dart';

class AudioEdit extends StatelessWidget {
  AudioEdit({
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
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return IconName(
                onTap: () {},
                icon: AudioItemsNames.audioItemList[index].audioItemAssets!,
                name: AudioItemsNames.audioItemList[index].audioItemNames!,
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
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          int adjustedIndex = index5(index);

          return IconName(
            onTap: () {
              print(adjustedIndex);
              if (index == 0) {
                itemsListCubit?.switchToBase();
              }
            },
            index: index,
            icon: AudioItemsNames.audioItemList[adjustedIndex].audioItemAssets!,
            name: index == 0
                ? ""
                : AudioItemsNames.audioItemList[adjustedIndex].audioItemNames!,
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
