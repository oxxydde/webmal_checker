import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF112C32);
const Color headerbgColor = Color(0xFF004650);
const Color bgTextFieldColor = Color(0xFF78ABA8);
const Color resultBoxColor = Color(0xFF00597E);

Color getDangerColor(int val) {
  if (val > 3) {
    return const Color(0xFFFF6347);
  } else if (val > 0) {
    return const Color(0xFFFFDB12);
  } else {
    return const Color(0xFF39B200);
  }
}