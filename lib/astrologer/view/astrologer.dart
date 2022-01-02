import 'package:astrologer/astrologer/controllers/controller_astrologer.dart';
import 'package:astrologer/astrologer/widgets/appbar.dart';
import 'package:astrologer/astrologer/widgets/list_tile.dart';
import 'package:astrologer/astrologer/widgets/search_field.dart';
import 'package:astrologer/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

export '../controllers/controller_astrologer.dart';
export '../models/models.dart';
export '../widgets/list_tile.dart';

class Astrologer extends GetView<AstroController> {
  const Astrologer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Obx(
        () => Scaffold(
            appBar: controller.dataList.isEmpty ? null : astroAppbar(),
            body: Container(
              padding: const EdgeInsets.all(kLayoutSpacing),
              child: controller.dataList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.red,
                    ))
                  : renderAstrologers(controller),
            )),
      ),
    );
  }

  Column renderAstrologers(AstroController controller) {
    TextEditingController userInput = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Talk to an astrologer',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        TextFormField(
            decoration: searchDeoration(error: null),
            controller: userInput,
            onChanged: (value) {
              userInput.text = value.toString();
              debugPrint(value);
            }),
        const SizedBox(height: 10),
        Expanded(
          child: Obx(() => ListView.builder(
              itemCount: controller.dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return buildListItemTile(context, controller.dataList[index]);
              })),
        )
      ],
    );
  }
}
