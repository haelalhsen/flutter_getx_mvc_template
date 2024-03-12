import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_zero/app/widgets/general_horizontal_seprater_widget.dart';
import 'package:task_zero/config/app_theme.dart';

import '../../../../config/translations/strings_enum.dart';

class CardDetailsWidget extends StatelessWidget {
  final String cardHolder;
  final String cvv;
  final String expiryDate;
  final String cardNumber;

  const CardDetailsWidget(
      {super.key,
      required this.cardHolder,
      required this.cvv,
      required this.expiryDate, required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 50.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: AppColors.secondColor(1),
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 4),
          ]),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/visa.png',
                height: 15.w,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
               cardNumber,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.headlineMedium!.merge(TextStyle(
                    color: AppColors.whiteTextColor(1),
                    fontWeight: FontWeight.w400)),
              ),
            ],
          ),
          const VerticalSeprater(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    Strings.cardHolder.tr,
                    style: Theme.of(context).textTheme.bodySmall!.merge(
                        TextStyle(
                            color: AppColors.whiteTextColor(1),
                            fontWeight: FontWeight.w400)),
                  ),
                  Text(
                   cardHolder,
                    style: Theme.of(context).textTheme.bodyLarge!.merge(
                        TextStyle(
                            color: AppColors.whiteTextColor(1),
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    Strings.expiryDate.tr,
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.bodySmall!.merge(
                        TextStyle(
                            color: AppColors.whiteTextColor(1),
                            fontWeight: FontWeight.w400)),
                  ),
                  Text(
                    expiryDate,
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.bodyLarge!.merge(
                        TextStyle(
                            color: AppColors.whiteTextColor(1),
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
