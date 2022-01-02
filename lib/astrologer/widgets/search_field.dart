import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

searchDeoration({var error}) {
  return InputDecoration(
    focusColor: Colors.white,
    isDense: true,
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
