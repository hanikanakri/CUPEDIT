import 'package:flutter/material.dart';

import '../../../../core/constants/app_theme.dart';
import '../../../../core/widgets/custom_image.dart';

class CustomDrawerItem extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;

  const CustomDrawerItem({super.key, 
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text, style: AppTheme.bodyText1),
      leading: CustomImage.circular(
          isNetworkImage: false,
          svg: false,
          radius: 20,
          image: image),
      onTap: onTap,
    );
  }
}
