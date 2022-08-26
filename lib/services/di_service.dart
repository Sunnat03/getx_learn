import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learn_getx/page/home/detall_controller.dart';

import '../page/home/home_controller.dart';

class DIService{
  static Future<void>init() async{
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<DetailController>(() => DetailController(), fenix: true);

  }
}