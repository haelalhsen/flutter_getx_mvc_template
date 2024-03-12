import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_zero/utils/general_helper.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../data/models/city.dart';
import '../../../data/models/country.dart';

class AddAddressController extends GetxController {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late GlobalKey<FormState> formKey;

  late TextEditingController nameTextEditingController;
  late TextEditingController addressTextEditingController;
  late TextEditingController territoryTextEditingController;
  late TextEditingController postalCodeTextEditingController;

  var selectedCity = City(name: Strings.selectYourCity.tr).obs;
  var selectedCountry = Country(name: Strings.selectYourCountry.tr).obs;

  /// this lists will come from api later
  ///
  List<Country> countries = [
    Country(id: 1, name: 'Iraq'),
    Country(id: 2, name: 'Syria'),
  ];
  List<City> cities = [
    City(id: 1, name: 'Bagdad1'),
    City(id: 2, name: 'City2'),
  ];

  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    formKey = GlobalKey<FormState>();
    nameTextEditingController = TextEditingController();
    addressTextEditingController = TextEditingController();
    territoryTextEditingController = TextEditingController();
    postalCodeTextEditingController = TextEditingController();
    countries.insert(0, selectedCountry.value);
    cities.insert(0, selectedCity.value);
    super.onInit();
  }

  Future<void> addNewAddress() async {
    if (!formKey.currentState!.validate()) {
      GeneralHelper.of(scaffoldKey.currentContext!)
          .showErrorMessage(Strings.pleaseCompleteMissingFields.tr);
    }else{
      GeneralHelper.of(scaffoldKey.currentContext!)
          .showSuccessMessage(Strings.success.tr);
    }
  }
}
