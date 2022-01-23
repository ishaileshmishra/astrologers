import 'package:astrologer/view/astrologer/bindings/astro_binding.dart';
import 'package:astrologer/view/astrologer/view/astrologer.dart';
import 'package:astrologer/view/astrologer/view/unknown_route_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const AstrologersApp());
}

class AstrologersApp extends StatelessWidget {
  const AstrologersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    debugPrint(box.hasData('key').toString());
    return GetMaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        unknownRoute: GetPage(
            name: '/notfound',
            arguments: 'page not fount for errors',
            page: () => const UnknownRoutePage()),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
              .copyWith(secondary: Colors.pink),
        ),
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/',
            page: () => const Astrologer(),
            binding: AstroBinding(),
            transition: Transition.cupertino,
            opaque: true,
          ),
        ]);
  }
}
