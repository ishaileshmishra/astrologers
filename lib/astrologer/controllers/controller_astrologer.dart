import 'package:astrologer/api.dart';
import 'package:astrologer/astrologer/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AstroController extends GetxController {
  var dataList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getAstroList();
  }

  stringyfyLanguage(List<Language> lanList) {
    List stringyfyLang = [];
    for (var element in lanList) {
      stringyfyLang.add(element.name);
    }
    return stringyfyLang.join(", ");
  }

  stringyfySkills(List<Skill> skills) {
    List stringyfySkill = [];
    for (var element in skills) {
      stringyfySkill.add(element.name);
    }
    return stringyfySkill.join(", ");
  }

  getAstroList() {
    getAstrologers().then((value) {
      if (value.success) {
        dataList.value = value.data;
      } else {
        dataList = [].obs;
        debugPrint('Failed, could not fetch the data');
      }
    }).catchError((err) {
      dataList = [].obs;
      debugPrint('Failed With Exception, diagnose it: ');
    });
  }
}
