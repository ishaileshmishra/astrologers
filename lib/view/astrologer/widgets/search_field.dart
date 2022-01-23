import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image_picker/image_picker.dart';

List<String> imagePaths = [];

searchDeoration({var error}) {
  return InputDecoration(
    focusColor: Colors.white,
    isDense: true,

    suffixIcon: GestureDetector(
      onTap: () => _openCamera(),
      child: const Icon(
        Icons.camera_alt_rounded,
        size: 25,
        color: Colors.grey,
      ),
    ),

    prefixIcon: const Icon(
      CupertinoIcons.search_circle_fill,
      color: Colors.amber,
      size: 30,
    ),
    iconColor: Colors.amber,
    errorText: error,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      gapPadding: 4.0,
    ),

    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    fillColor: Colors.grey,

    hintText: "Search by Astrologers",

    //make hint text
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),

    //create lable
    labelText: 'Astrologers',
    //lable style
    labelStyle: const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}

_openCamera() async {
  final imagePicker = ImagePicker();
  final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    debugPrint('Picked file path is: ${pickedFile.path}');
    imagePaths.add(pickedFile.path);
    _onShare(imagePaths);
  }
}

void _onShare(imagePaths) async {
  //final box = context.findRenderObject() as RenderBox?;
  if (imagePaths.isNotEmpty) {
    await Share.shareFiles(imagePaths,
        text: 'To Darshana', subject: 'Technource');
    //sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  } else {
    await Share.share('text', subject: 'subject');
    //sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
