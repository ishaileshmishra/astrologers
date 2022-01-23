import 'package:astrologer/constant.dart';
import 'package:astrologer/view/astrologer/view/astrologer.dart';
import 'package:astrologer/view/astrologer/view/astrologer_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

ListTile buildListItemTile(BuildContext context, AstroModel _dataModel) {
  final AstroController controller = Get.find();
  return ListTile(
    onTap: () => Get.to(
        () => AstroDetail(dataModel: _dataModel)), // Navigate to next screen
    leading: _leadingIcon(_dataModel),
    title: _itemTitle(_dataModel),
    subtitle: _itemRenderSubtitle(_dataModel, controller),
    dense: false,
  );
}

ClipRRect _leadingIcon(AstroModel _dataModel) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.network(
      _dataModel.images.medium.imageUrl,
      height: 80.0,
      width: 80.0,
    ),
  );
}

Column _itemRenderSubtitle(AstroModel _dataModel, AstroController controller) {
  var langs = controller.stringyfyLanguage(_dataModel.languages);
  return Column(
    children: [
      _allSkills(_dataModel, controller),
      const SizedBox(height: kPaddingAction),
      _knownLanguages(langs),
      const SizedBox(height: kPaddingAction),
      _priceAndExp(_dataModel),
      const SizedBox(height: kLayoutSpacing),
      _callingBtn(_dataModel)
    ],
  );
}

_callingBtn(AstroModel _dataModel) {
  return ElevatedButton.icon(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.amber.shade800),
    ),
    onPressed: () => debugPrint('Clicked'),
    icon: const Icon(
      Icons.phone,
      color: Colors.white,
    ),
    label: const SizedBox(
      width: 80,
      height: 40,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Talk On Call',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Column _priceAndExp(AstroModel _dataModel) {
  return Column(
    children: [
      Row(
        children: [
          const Icon(Icons.money, color: Colors.amber),
          const SizedBox(width: 10),
          Flexible(
              child: Text(
            'Rs ' + _dataModel.additionalPerMinuteCharges.toString(),
            style: const TextStyle(fontWeight: FontWeight.normal),
          )),
        ],
      ),
      const SizedBox(height: kPaddingAction),
      Row(
        children: [
          const Icon(Icons.admin_panel_settings, color: Colors.amber),
          const SizedBox(width: 10),
          Flexible(
              child: Text(
            '${_dataModel.experience} Years',
            style: const TextStyle(fontWeight: FontWeight.normal),
          )),
        ],
      ),
    ],
  );
}

Row _knownLanguages(String languages) {
  return Row(
    children: [
      const Icon(Icons.language_sharp, color: Colors.amber),
      const SizedBox(width: 10),
      Flexible(child: Text(languages, softWrap: true)),
    ],
  );
}

Row _allSkills(AstroModel _dataModel, AstroController controller) {
  return Row(
    children: [
      const Icon(Icons.home_rounded, color: Colors.amber),
      const SizedBox(width: 10),
      _dataModel.skills.isEmpty
          ? const Flexible(child: Text('data not found'))
          : Flexible(
              child: Text(controller.stringyfySkills(_dataModel.skills),
                  maxLines: 3),
            ),
    ],
  );
}

Padding _itemTitle(AstroModel _dataModel) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: _dataModel.urlSlug.isEmpty
        ? const Text('Not Available')
        : Text(_dataModel.firstName + ' ' + _dataModel.lastName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
  );
}
