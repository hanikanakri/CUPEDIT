import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/widgets/custom_image.dart';

class CustomProfileAppbar extends StatelessWidget {
  const CustomProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            // Add your onPressed logic here
          },
          icon: CustomImage.rectangle(
            image: AppAssets.question,
            height: 22,
            width: 22,
          ),
        ),
        IconButton(
          onPressed: () {
            // Open the drawer when the menu icon is clicked
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu_outlined,
          ),
        ),
      ],
    );
  }
}
