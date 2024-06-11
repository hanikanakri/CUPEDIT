import 'package:flutter/material.dart';

import '/core/widgets/container_list_item.dart';
import '/features/edit_new_project/items_cubit/items_list_cubit.dart';
import '/features/edit_new_project/presentation/widgets/Icon_name.dart';
import '/features/text_edit/presentation/widgets/add_text.dart';
import '/features/text_edit/presentation/widgets/text_edit_items.dart';

class TextEdit extends StatelessWidget {
  TextEdit({
    super.key,
    this.itemsListCubit,
    this.popScope,
  });

  ItemsListCubit? itemsListCubit;

  ValueChanged<bool>? popScope = (value) => true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerListItem(
          itemsListCubit: itemsListCubit!,
          childList: ListView.builder(
            itemCount: 6,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return IconName(
                onTap: () {
                  print("TextEdit index $index");
                  _textOperation(index, context);
                },
                name: TextEditItems.textEditItemsList[index].textEditItemsName!,
                icon:
                    TextEditItems.textEditItemsList[index].textEditItemsAssets!,
              );
            },
          ),
        )
        //itemList(context),
      ],
    );
  }

  _textOperation(int index, BuildContext context) {
    switch (index) {
      case 0:
        print(index);
        return showBottomSheet(
          context: context,
          builder: (context) {
            return AddText();
          },
        );

        break;
      case 1:
        print(index);
        break;
      case 2:
        print(index);
        break;
      case 3:
        print(index);
        break;
      case 4:
        print(index);
        break;
      case 5:
        print(index);
        break;
    }
  }
}
