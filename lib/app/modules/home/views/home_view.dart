import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_zero/config/app_theme.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/general_helper.dart';
import '../../../data/models/route_argument.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/general_app_bar_widget.dart';
import '../../../widgets/general_button_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: GeneralHelper.of(context).onWillPop,
      child: Scaffold(
        key: controller.scaffoldKey,
        body: bodyWidget(context),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return CustomScrollView(
      slivers: [
        GeneralAppBar(
          title: Strings.home.tr,
          implyLeading: false,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                GeneralButton(
                  color: AppColors.mainColor(1),
                  borderColor: AppColors.mainColor(1),
                  textColor: AppColors.whiteTextColor(1),
                  text: Strings.addNewAddress.tr,
                  onTap: () {
                    Get.toNamed(
                      Routes.ADD_ADDRESS,
                      arguments: RouteArgument(),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                GeneralButton(
                  color: AppColors.mainColor(1),
                  borderColor: AppColors.mainColor(1),
                  textColor: AppColors.whiteTextColor(1),
                  text: Strings.addNewCard.tr,
                  onTap: () {
                    Get.toNamed(
                      Routes.ADD_NEW_CARD,);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
