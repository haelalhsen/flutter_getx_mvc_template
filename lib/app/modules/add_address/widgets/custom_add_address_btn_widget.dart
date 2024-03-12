import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_zero/config/app_theme.dart';

import '../../../../config/translations/strings_enum.dart';

class CustomAddAddressBtn extends StatelessWidget {
  const CustomAddAddressBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: [8, 8, 8, 8],
      color: AppColors.secondColor(1),
      radius: Radius.circular(10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.secondColor(1),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                Strings.chooseYourLocation.tr,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
