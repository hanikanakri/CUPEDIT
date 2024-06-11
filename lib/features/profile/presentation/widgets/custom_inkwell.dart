import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_styles.dart';

class CustomInkwell extends StatelessWidget {
  final Widget child;
  double? height;
  final VoidCallback? onTap;

  CustomInkwell({super.key, required this.child, this.height, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height,
        alignment: Alignment.center,
        decoration: AppStyles.defaultBoxDecoration
            .copyWith(borderRadius: BorderRadius.circular(6)),
        child: child,
      ),
    );
  }
}
