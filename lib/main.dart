import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:learn_getx/page/home/detail_page.dart';
import 'package:learn_getx/page/home/home_page.dart';
import 'package:learn_getx/services/di_service.dart';

void main() async {
  await DIService.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/home',
          page: () =>  HomePage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 200),
        ),
        GetPage(
          name: '/detail',
          page: () => DetailPages(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ],
      home: HomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black
          )
        )
      ),
    );
  }
}


