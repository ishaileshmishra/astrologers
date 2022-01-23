import 'package:astrologer/constant.dart';
import 'package:flutter/material.dart';

astroAppbar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: double.minPositive,
    actions: [_allActions()],
    title: _appbarTitle(),
    //centerTitle: true,
    //leading: _leadingIcon(),
  );
}

// Padding _leadingIcon() {
//   return Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: Image.asset(
//       'assets/profile.png',
//     ),
//   );
// }

Padding _appbarTitle() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Image.asset(
      appLogo,
      width: 60,
      height: 60,
    ),
  );
}

Padding _allActions() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(kPaddingAction),
          child: Image.asset(
            searchPath,
            width: kPaddingSpacing,
            height: kPaddingSpacing,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kPaddingAction),
          child: Image.asset(
            filterPath,
            width: kPaddingSpacing,
            height: kPaddingSpacing,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kPaddingAction),
          child: Image.asset(
            sortPath,
            width: kPaddingSpacing,
            height: kPaddingSpacing,
          ),
        ),
      ],
    ),
  );
}
