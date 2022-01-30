import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';

import '../screens/main_screen.dart';
import '../constants.dart';

class HeaderMainScreen extends StatelessWidget {
  const HeaderMainScreen({Key? key, required this.size, required this.func})
      : super(key: key);

  final Size size;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.34,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: headerbgColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1EFFFFFF),
                    spreadRadius: 0.5,
                    blurRadius: 6,
                  )
                ]),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 45),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: bgTextFieldColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextField(
                    controller: MainScreen.urlField,
                    decoration: const InputDecoration(
                      hintText: "URL Link",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                    cursorColor: const Color(0xFF003366),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                // SPACER CONTAINER
                Container(height: 28),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4B8E40),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (RegExp(
                        r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)',
                        caseSensitive: false,
                        multiLine: false,
                      ).hasMatch(MainScreen.urlField.value.text)) {
                        func(MainScreen.urlField.value.text);
                      } else {
                        Fluttertoast.showToast(
                          msg: "Wrong format, please check again!",
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.red[700],
                        );
                      }
                    },
                    child: const Text(
                      "CHECK",
                      style: TextStyle(
                        letterSpacing: 2.2,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
