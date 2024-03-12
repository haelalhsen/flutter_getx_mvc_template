import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../config/app_theme.dart';

import '../../config/translations/strings_enum.dart';
import 'arrow_back_widget.dart';
import 'custom_icon_btn_widget.dart';

class GeneralAppBar extends StatelessWidget {
  final String title;
  final bool implyLeading;

  const GeneralAppBar({
    Key? key,
    required this.title,
    required this.implyLeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: titleWidget(context),
      automaticallyImplyLeading: implyLeading,
      centerTitle: true,
      pinned: true,
      actions: [
        implyLeading?SizedBox(width:10.w) :const SizedBox(),
      ],
      leading: implyLeading
          ? const ArrowBack()
          : null,
    );
  }

  Widget titleWidget(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
