import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../config/app_theme.dart';
import '../../config/translations/strings_enum.dart';
import '../../utils/general_validator.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final int? maxLines;
  final String? validationMessage;
  final bool? isNumber;
  final bool? isEnabled;
  final bool? validate;
  final bool? isEmail;
  final bool? isOptional;
  final String? title;
  final Function? onChanged;

  CustomTextInput({
    Key? key,
    this.controller,
    this.maxLines,
    this.validationMessage,
    this.isNumber,
    this.hint,
    this.isEmail,
    this.isEnabled, this.validate, this.title, this.onChanged, this.isOptional,
  }) : super(key: key);

  String? textValidation(String input) {
   if(!validate!){
     return null;
   }else{
     if(isEmail != null){
       return validator.email(input)
           ? null
           :validationMessage!.tr;
     }
     if(input.isEmpty){
       return validationMessage!.tr;
     }else{
       return null;
     }
   }
  }

  OutlineInputBorder focusedBorder=OutlineInputBorder(
    borderSide: BorderSide(
        color: AppColors.secondColor(1), width: 2),
    borderRadius: BorderRadius.circular(10),
  );
  OutlineInputBorder outlineInputBorder=OutlineInputBorder(
    borderSide: BorderSide(
        color: AppColors.grayColor(0.5), width: 2),
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title!,style: Theme.of(context).textTheme.bodyLarge,),
            if(isOptional!=null) const Text(' * ',style: TextStyle(color: Colors.red),)
          ],
        ),
        SizedBox(height: 1.h,),
        TextFormField(
            enabled: isEnabled,
            controller: controller,
            keyboardType: isNumber == null ? null : TextInputType.number,
            textInputAction: maxLines! > 1 ? TextInputAction.newline : null,
            maxLines: maxLines,
            validator: (input) => textValidation(input!),
            onChanged: (str){
              if(onChanged !=null){
                onChanged!(str);
              }
            },
            decoration: InputDecoration(
              border: outlineInputBorder,
              focusedBorder: focusedBorder,
              enabledBorder:outlineInputBorder,
              disabledBorder: outlineInputBorder,
              hintStyle: Theme.of(context).textTheme.labelSmall,
              hintText: hint!.tr,
            ),
            style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
