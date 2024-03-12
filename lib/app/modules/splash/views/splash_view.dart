import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/general_helper.dart';
import '../../../../config/app_theme.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/general_button_widget.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: GeneralHelper.of(context).onWillPop,
      child: Scaffold(
        key: controller.scaffoldKey,
        body:  Container(
          padding: EdgeInsets.only(bottom: 8.h),
          width: 100.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FlutterLogo(
                  size: 50.w,
                  duration: const Duration(seconds: 3),
                ).animate()
                    .slideY(duration: 900.ms, curve: Curves.easeOutCubic)
                    .fadeIn(delay: 200.ms),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
