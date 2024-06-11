import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import 'app_bar_custom.dart';

class GeneralHomePageScaffold extends StatelessWidget {
  final int index;
  final Widget? body;
  final Color? backgroundColor;
  final bool
      showAppBar; // New bool parameter to control the visibility of the app bar
  final Widget? drawerWidget;

  const GeneralHomePageScaffold({
    Key? key,
    this.body,
    this.backgroundColor,
    required this.index,
    this.showAppBar = false,
    this.drawerWidget, // Default value is true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: showAppBar ? AppBarCustomI(index: index) : null,
      // Conditionally show or hide the app bar
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: body ?? const SizedBox(),
      ),
      drawer: drawerWidget,
    );
  }
}
