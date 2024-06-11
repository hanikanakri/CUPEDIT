import 'package:cupcat/core/utils/validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/widgets/custom_text_field.dart';

class AddText extends StatelessWidget {
  AddText({super.key});

  final TextEditingController addTextController =
      TextEditingController(text: "enter_text".tr());

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: size * 0.4,
      color: AppColors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomTextField(
                controller: addTextController,
                keyboardType: TextInputType.text,
                validator: (value) => Validator.nameValidate(value!, context),
                hintText: "hintText",
              ),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
