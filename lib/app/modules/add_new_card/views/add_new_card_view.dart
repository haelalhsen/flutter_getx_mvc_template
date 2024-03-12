import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../config/app_theme.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../widgets/general_app_bar_widget.dart';
import '../../../widgets/general_button_widget.dart';
import '../../../widgets/general_horizontal_seprater_widget.dart';
import '../controllers/add_new_card_controller.dart';
import '../widgets/card_details_form_widget.dart';
import '../widgets/card_details_widget.dart';

class AddNewCardView extends GetView<AddNewCardController> {
  const AddNewCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: bodyWidget(context),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return CustomScrollView(
      slivers: [
        GeneralAppBar(
          title: Strings.addNewCard.tr,
          implyLeading: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 90.w,
                      child: Text(
                        Strings.addNewCardDetails.tr,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
                const VerticalSeprater(),
                Obx(
                  () => CardDetailsWidget(
                    cardHolder: controller.cardHolder.value,
                    expiryDate: controller.expiryDate.value,
                    cvv: controller.cvv.value,
                    cardNumber: controller.cardNumber.value,
                  ),
                ),
                const VerticalSeprater(),
                CardDetailsFormWidget(
                  formKey: controller.formKey,
                  cardHolderController:
                      controller.cardHolderTextEditingController,
                  cardNumberController:
                      controller.cardNumberTextEditingController,
                  cvvController: controller.cvvTextEditingController,
                  expiryDateController:
                      controller.expiryDateTextEditingController,
                  onCardHolderChanged: (str) {
                    controller.cardHolder.value=str;
                  },
                  onExpiryDateChanged: (str) {
                    controller.reFormatExpiryDate(str);
                  },
                  onCardNumberChanged: (str){
                    controller.reFormatCardNumber(str);
                  },
                ),
                const VerticalSeprater(),
                const VerticalSeprater(),
                GeneralButton(
                  color: AppColors.secondColor(1),
                  borderColor: AppColors.secondColor(1),
                  textColor: AppColors.whiteTextColor(1),
                  text: Strings.add.tr,
                  onTap: () {
                    controller.addNewCard();
                  },
                ),
                const VerticalSeprater(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
