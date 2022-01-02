import 'package:astrologer/astrologer/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

detailAppbar(String fullname) {
  return AppBar(
    title: Text(fullname),
    elevation: 0,
    titleSpacing: 10,
  );
}

Image showImage(dataModel, Size _deviceSize) {
  return Image.network(
    dataModel.images.large.imageUrl,
    width: double.infinity,
    height: _deviceSize.height / 2,
    fit: BoxFit.cover,
  );
}

_textStyle() {
  return const TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );
}

_showRow(String _title, String _content) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(_title, style: _textStyle()),
    Text(_content),
  ]);
}

Padding detailpageMore(AstroModel dataModel) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dataModel.aboutMe.isEmpty
            ? const Text('')
            : Text('About Me: ' + dataModel.aboutMe),
        dataModel.aboutMe.isEmpty
            ? const SizedBox(height: 0)
            : const SizedBox(height: 10),
        _showRow('Experience:', dataModel.experience.toString()),
        const SizedBox(height: 10),
        _showRow(
            'Minimum Call Duration:', dataModel.minimumCallDuration.toString()),
        const SizedBox(height: 10),
        _showRow('Additional Per Minute Charges:',
            dataModel.additionalPerMinuteCharges.toString()),
        const SizedBox(height: 10),
        dataModel.isAvailable
            ? _showRow(
                'Atrologer Availability:',
                'Available',
              )
            : _showRow(
                'Atrologer Availability:',
                'Not Available',
              ),
        const SizedBox(height: 10),
        _showRow('Astrologer is on call:', dataModel.isOnCall.toString()),
        const SizedBox(height: 10),
        _showRow('Free Minutes:', dataModel.freeMinutes.toString()),
        const SizedBox(height: 10),
        _showRow('Additional Minutes:', dataModel.additionalMinute.toString()),
        const SizedBox(height: 20),
        showDismissBtn(),
        const SizedBox(height: 30),
      ],
    ),
  );
}

SizedBox showDismissBtn() {
  return SizedBox(
    height: 40,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red, // background
        onPrimary: Colors.yellow, // foreground
      ),
      onPressed: () => Get.back(),
      child: const Text('Done ! Go back'),
    ),
  );
}
