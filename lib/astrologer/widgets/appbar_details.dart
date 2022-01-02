import 'package:astrologer/astrologer/models/models.dart';
import 'package:flutter/material.dart';

detailAppbar(String fullname) {
  return AppBar(
    title: Text(fullname),
    elevation: 0,
    titleSpacing: 10,
  );
}

_textStyle() {
  return const TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );
}

Padding detailpageMore(AstroModel dataModel) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dataModel.aboutMe.isEmpty
            ? const Text('')
            : Text('About Me: ' + dataModel.aboutMe),
        dataModel.aboutMe.isEmpty
            ? const SizedBox(height: 0)
            : const SizedBox(height: 10),
        Text('Experience: ${dataModel.experience}', style: _textStyle()),
        const SizedBox(height: 10),
        Text('Minimum Call Duration: ${dataModel.minimumCallDuration}',
            style: _textStyle()),
        const SizedBox(height: 10),
        Text(
            'Additional Per Minute Charges: ${dataModel.additionalPerMinuteCharges}',
            style: _textStyle()),
        const SizedBox(height: 10),
        dataModel.isAvailable
            ? Text('Atrologer Availability: Available', style: _textStyle())
            : Text('Atrologer Availability: Not Available',
                style: _textStyle()),
        const SizedBox(height: 10),
        Text('Astrologer is on call: ${dataModel.isOnCall}',
            style: _textStyle()),
        const SizedBox(height: 10),
        Text('Free Minutes: ${dataModel.freeMinutes}', style: _textStyle()),
        const SizedBox(height: 10),
        Text('Additional Minutes: ${dataModel.additionalMinute}',
            style: _textStyle()),
      ],
    ),
  );
}
