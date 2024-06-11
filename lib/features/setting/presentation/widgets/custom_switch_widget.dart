import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';

class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({super.key});

  @override
  _CustomSwitchWidgetState createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 25,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          activeColor: AppColors.black,
          onChanged: (bool value) {
            setState(() {
              _value = value;
            });
          },
          value: _value,
        ),
      ),
    );
  }
}
