import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/general_helper.dart';

class AddNewCardController extends GetxController {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late GlobalKey<FormState> formKey;

  late TextEditingController cardHolderTextEditingController;
  late TextEditingController cardNumberTextEditingController;
  late TextEditingController cvvTextEditingController;
  late TextEditingController expiryDateTextEditingController;

  var cardHolder=''.obs;
  var expiryDate=''.obs;
  var cardNumber='**** **** **** ****'.obs;
  var cvv=''.obs;

  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    formKey = GlobalKey<FormState>();
    cardHolderTextEditingController = TextEditingController();
    cardNumberTextEditingController = TextEditingController();
    cvvTextEditingController = TextEditingController();
    expiryDateTextEditingController = TextEditingController();
    super.onInit();
  }

  void reFormatCardNumber(String str){
    String tempStr='';
    str =  str.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
    for(int i=0;i<18;i++){
      if( i == 4 || i==9 || i==14){
        tempStr +=' ';
      }else{
        if(i<str.length){
          tempStr += str[i];
        }else{
          tempStr +='*';
        }
      }
    }
    cardNumber.value=tempStr;
  }
  void reFormatExpiryDate(String str){
    String tempStr='';
    for(int i=0;i<5;i++){
      if( i == 2){
        tempStr +=' / ';
      }else{
        if(i<str.length){
          tempStr += str[i];
        }else{
          tempStr +='0';
        }
      }
    }
    expiryDate.value=tempStr;
  }
  Future<void> addNewCard() async {
    if (!formKey.currentState!.validate()) {
      GeneralHelper.of(scaffoldKey.currentContext!)
          .showErrorMessage(Strings.pleaseCompleteMissingFields.tr);
    }else{
      GeneralHelper.of(scaffoldKey.currentContext!)
          .showSuccessMessage(Strings.success.tr);
    }
  }
}
