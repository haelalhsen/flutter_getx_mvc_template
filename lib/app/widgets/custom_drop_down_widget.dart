import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../config/app_theme.dart';

class CustomDropDown extends StatelessWidget {
  final String? title;
  final String? hint;
  final List<dynamic>? itemsList;
  final Function? onItemSelected;
  final bool? isOptional;
  dynamic selectedItem;

  CustomDropDown(
      {this.title,
      this.itemsList,
      this.onItemSelected,
      this.isOptional,
      this.selectedItem,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          width: 100.w - 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: AppColors.grayColor(0.5),
                width: 2.0,
              )),
          child: DropdownButton(
            value: selectedItem,
            hint: Text(
              hint!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            isExpanded: true,
            onChanged: (item) {
              onItemSelected!(item);
            },
            items: itemsList!.map((item) {
              return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ));
            }).toList(),
            dropdownColor: Colors.white,
            underline: const SizedBox(),
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
