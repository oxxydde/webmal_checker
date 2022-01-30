import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: scrSize.width,
          alignment: Alignment.center,
          child: const Text(
            "MALICIOUS WEBSITE CHECK",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),
          ),
        ),
        Container(height: 45),
        Container(
          width: scrSize.width,
          alignment: Alignment.center,
          child: const Text(
            "v1.0.0",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Container(height: 15),
        Container(
          width: scrSize.width,
          alignment: Alignment.center,
          child: const Text(
            "Project by OXXYDDE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}