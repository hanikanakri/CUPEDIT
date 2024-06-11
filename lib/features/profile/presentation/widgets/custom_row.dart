import 'package:flutter/material.dart';

import '../../../../../core/constants/app_theme.dart';

class CustomRow extends StatelessWidget {
  final Widget? leadingIcon;
  final String text;
  final Widget? trailingIcon;

  const CustomRow({super.key, this.leadingIcon, required this.text, this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          if (leadingIcon != null) leadingIcon!,
          const SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: AppTheme.bodyText1,
          ),
          const SizedBox(
            width: 6,
          ),
          if (trailingIcon != null) trailingIcon!,
        ],
      ),
    );
  }
}
