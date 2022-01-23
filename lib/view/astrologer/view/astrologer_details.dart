import 'package:astrologer/responsive_widgets/resp_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'astrologer.dart';
import '../widgets/appbar_details.dart';

class AstroDetail extends GetView<AstroController> {
  const AstroDetail({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  final AstroModel dataModel;
  @override
  Widget build(BuildContext context) {
    var _deviceSize = MediaQuery.of(context).size;
    String _fullname = dataModel.firstName + ' ' + dataModel.lastName;

    return Scaffold(
      appBar: detailAppbar(_fullname),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.back(),
        isExtended: true,
        child: const ResponsiveButton(),
        tooltip: 'dismiss the page',
      ),
      body: Container(
        padding: const EdgeInsets.all(0),
        child: ListView(
          shrinkWrap: true,
          children: [
            showImage(dataModel, _deviceSize),
            detailpageMore(dataModel),
          ],
        ),
      ),
    );
  }
}
