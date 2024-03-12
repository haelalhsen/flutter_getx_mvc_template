import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_zero/config/translations/strings_enum.dart';

import '../../../data/models/city.dart';
import '../../../data/models/country.dart';
import '../../../widgets/custom_drop_down_widget.dart';
import '../../../widgets/custom_text_input_widget.dart';
import '../../../widgets/general_horizontal_seprater_widget.dart';

class AddressDetailsForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController territoryController;
  final TextEditingController postalCodeController;
  final List<Country> countries;
  final List<City> cities;
  final Country? selectedCountry;
  final City? selectedCity;
  final Function onCountrySelected;
  final Function onCitySelected;

  const AddressDetailsForm(
      {super.key,
      required this.formKey,
      required this.nameController,
      required this.addressController,
      required this.countries,
      required this.cities,
      this.selectedCountry,
      this.selectedCity, required this.onCountrySelected, required this.onCitySelected, required this.territoryController, required this.postalCodeController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextInput(
            controller: nameController,
            title: Strings.fullName.tr,
            maxLines: 1,
            validationMessage: Strings.thisFieldIsRequired.tr,
            hint: Strings.name.tr,
            isEnabled: true,
            validate: true,
          ),
          const VerticalSeprater(),
          CustomTextInput(
            controller: addressController,
            title: Strings.address.tr,
            maxLines: 1,
            validationMessage: Strings.thisFieldIsRequired.tr,
            hint: Strings.addAddress.tr,
            isEnabled: true,
            validate: true,
          ),
          const VerticalSeprater(),
          CustomDropDown(
            title: Strings.country.tr,
            hint: Strings.selectYourCountry.tr,
            itemsList: countries,
            isOptional: false,
            selectedItem: selectedCountry,
            onItemSelected: (item) {
              onCountrySelected(item);
            },
          ),
          const VerticalSeprater(),
          CustomDropDown(
            title: Strings.city.tr,
            hint: Strings.selectYourCity.tr,
            itemsList: cities,
            isOptional: false,
            selectedItem: selectedCity,
            onItemSelected: (item) {
              onCitySelected(item);
            },
          ),
          const VerticalSeprater(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 45.w,
                child: CustomTextInput(
                  controller: territoryController,
                  title: Strings.territory.tr,
                  maxLines: 1,
                  validationMessage: Strings.thisFieldIsRequired.tr,
                  hint: Strings.selectYourTerritory.tr,
                  isEnabled: true,
                  validate: true,
                ),
              ),
              SizedBox(
                width: 45.w,
                child: CustomTextInput(
                  controller: postalCodeController,
                  title: Strings.postalCode.tr,
                  maxLines: 1,
                  validationMessage: Strings.thisFieldIsRequired.tr,
                  hint: Strings.addYourPostalCode.tr,
                  isEnabled: true,
                  validate: true,
                  isNumber: true,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
