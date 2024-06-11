import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class TextSwitch extends StatefulWidget {
  final bool? isFirstSelected;
  final VoidCallback? onPressFirst;
  final VoidCallback? onPressSecond;
  final String? firstText;
  final String? secondText;

  const TextSwitch(
      {Key? key,
      this.isFirstSelected = true,
      this.firstText,
      this.secondText,
      required this.onPressFirst,
      required this.onPressSecond})
      : super(key: key);

  @override
  State<TextSwitch> createState() => _TextSwitchState();
}

class _TextSwitchState extends State<TextSwitch> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: widget.onPressFirst,
          child: Column(
            children: [
              Text(
                widget.firstText ?? "",
                style: AppTheme.headline.copyWith(
                  fontWeight: FontWeight.bold,
                  color: widget.isFirstSelected!
                      ? AppColors.lightBlueAccent
                      : AppColors.white,
                ),
              ),
              Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: widget.isFirstSelected!
                      ? AppColors.lightBlueAccent
                      : AppColors.transparent,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: widget.onPressSecond,
          child: Column(
            children: [
              Text(
                widget.secondText ?? "",
                style: AppTheme.headline.copyWith(
                  fontWeight: FontWeight.bold,
                  color: widget.isFirstSelected!
                      ? AppColors.white
                      : AppColors.lightBlueAccent,
                ),
              ),
              Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: widget.isFirstSelected!
                      ? AppColors.transparent
                      : AppColors.lightBlueAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
