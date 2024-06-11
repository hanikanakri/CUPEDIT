import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class HomeNewProjectCard extends StatelessWidget {
  const HomeNewProjectCard({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height / 4, // Quarter of screen height
      width: MediaQuery.of(context).size.width, // Full screen width
      decoration: BoxDecoration(
        gradient: AppColors.homwPageCardGradinet,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "new_project".tr(),
                style: AppTheme.headline,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
