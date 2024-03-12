import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_zero/app/widgets/general_horizontal_seprater_widget.dart';

import '../../../../config/app_theme.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../widgets/general_app_bar_widget.dart';
import '../../../widgets/general_button_widget.dart';
import '../controllers/add_address_controller.dart';
import '../widgets/address_details_form_widget.dart';
import '../widgets/custom_add_address_btn_widget.dart';

class AddAddressView extends GetView<AddAddressController> {
  const AddAddressView({Key? key}) : super(key: key);

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
          title: Strings.addNewAddress.tr,
          implyLeading: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(15),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Strings.addNewAddressDetails.tr,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const VerticalSeprater(),
                const CustomAddAddressBtn(),
                const VerticalSeprater(),
                Obx(
                  () => AddressDetailsForm(
                    formKey: controller.formKey,
                    nameController: controller.nameTextEditingController,
                    addressController: controller.addressTextEditingController,
                    countries: controller.countries,
                    cities: controller.cities,
                    onCitySelected: (city) {
                      controller.selectedCity.value = city;
                    },
                    onCountrySelected: (country) {
                      controller.selectedCountry.value = country;
                    },
                    selectedCity: controller.selectedCity.value,
                    selectedCountry: controller.selectedCountry.value,
                    territoryController:
                        controller.territoryTextEditingController,
                    postalCodeController:
                        controller.postalCodeTextEditingController,
                  ),
                ),
                const VerticalSeprater(),
                GeneralButton(
                  color: AppColors.secondColor(1),
                  borderColor: AppColors.secondColor(1),
                  textColor: AppColors.whiteTextColor(1),
                  text: Strings.add.tr,
                  onTap: () {
                   controller.addNewAddress();
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
