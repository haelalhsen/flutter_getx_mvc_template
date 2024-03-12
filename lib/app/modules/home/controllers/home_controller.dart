import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState>? scaffoldKey;


  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    super.onInit();
  }


}
