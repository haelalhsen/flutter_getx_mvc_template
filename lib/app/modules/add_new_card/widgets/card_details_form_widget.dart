import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../widgets/custom_text_input_widget.dart';
import '../../../widgets/general_horizontal_seprater_widget.dart';

class CardDetailsFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController cardHolderController;
  final TextEditingController cvvController;
  final TextEditingController expiryDateController;
  final TextEditingController cardNumberController;

  final Function onCardHolderChanged;
  final Function onCardNumberChanged;
  final Function onExpiryDateChanged;

  const CardDetailsFormWidget(
      {super.key,
      required this.formKey,
      required this.cardHolderController,
      required this.cvvController,
      required this.expiryDateController,
      required this.cardNumberController,
      required this.onCardHolderChanged,
      required this.onExpiryDateChanged,
      required this.onCardNumberChanged});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextInput(
            controller: cardHolderController,
            title: Strings.cardHolder.tr,
            maxLines: 1,
            validationMessage: Strings.thisFieldIsRequired.tr,
            hint: Strings.cardHolder.tr,
            isEnabled: true,
            validate: true,
            isOptional: false,
            onChanged: (str) {
              onCardHolderChanged(str);
            },
          ),
          const VerticalSeprater(),
          CustomTextInput(
            controller: cardNumberController,
            title: Strings.cardNumber.tr,
            maxLines: 1,
            validationMessage: Strings.thisFieldIsRequired.tr,
            hint: Strings.cardNumberHint.tr,
            isEnabled: true,
            validate: true,
            isOptional: false,
            isNumber: true,
            onChanged: (str) {
              onCardNumberChanged(str);
            },
          ),
          const VerticalSeprater(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 42.w,
                child: CustomTextInput(
                  controller: expiryDateController,
                  title: Strings.expiryDate.tr,
                  maxLines: 1,
                  validationMessage: Strings.thisFieldIsRequired.tr,
                  hint: Strings.expiryDateHint.tr,
                  isEnabled: true,
                  validate: true,
                  isOptional: false,
                  isNumber: true,
                  onChanged: (str) {
                    onExpiryDateChanged(str);
                  },
                ),
              ),
              SizedBox(
                width: 42.w,
                child: CustomTextInput(
                  controller: cvvController,
                  title: Strings.cvv.tr,
                  maxLines: 1,
                  validationMessage: Strings.thisFieldIsRequired.tr,
                  hint: Strings.cvvHint.tr,
                  isEnabled: true,
                  validate: true,
                  isNumber: true,
                  isOptional: false,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
