 import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
 import '../../../home/presentation/widgets/general_home_page_scaffold.dart';
import '../widgets/features.dart';
import '../widgets/interactions.dart';
import '../widgets/official1.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: GeneralHomePageScaffold(
        showAppBar:true ,
        index: 2,
        backgroundColor: AppColors.grey50,
        body: TabBarView(
          children: [
            CapCutOfficial(),
            const TabInteraction(),
            const TabFeatures(),
          ],
        ),
      ),
    );
  }
}
