import 'package:flutter/material.dart';

import '../constants.dart';
import '../layouts/header_main_screen.dart';
import '../components/get_analysis.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static TextEditingController urlField = TextEditingController();

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  static Size size = const Size(0, 0);

  static Widget resultBox(bool isLoading, {int safe = 0, danger = 0}) {
    Widget dataResult = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "RESULT",
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${danger ?? 0}",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  color: getDangerColor(danger),
                  fontSize: 95,
                ),
              ),
              TextSpan(
                text: '/${(safe) + (danger)}',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  color: getDangerColor(danger),
                  fontSize: 28,
                ),
              ),
            ],
          ),
        ),
        const Text(
          "OF SECURITY VENDORS DETECTED AS MALICIOUS",
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
    Widget loadingBox = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        SizedBox(
          height: 65,
          width: 65,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
        Text(
          "LOADING...",
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
      ],
    );

    Widget result = Container();

    if (isLoading) {
      result = loadingBox;
    }
    else {
      result = dataResult;
    }

    return SizedBox(
      height: size.height * 0.46,
      child: Container(
        height: double.infinity,
        width: size.width * 0.715,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: resultBoxColor,
        ),
        child: result,
      ),
    );
  }

  static Widget bottomBox = resultBox(false);

  void findData(String url) async {
    setState(() {
      bottomBox = FutureBuilder(
        future: getData(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              dynamic data = snapshot.data;
              return resultBox(false, safe: data['safe'], danger: data['danger']);
            }
          }
          else if (snapshot.connectionState == ConnectionState.none) {
            return resultBox(true);
          }
          return resultBox(true);
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(
      children: [
        HeaderMainScreen(
          size: size,
          func: findData,
        ),
        Container(height: 30),
        bottomBox,
        Container(
          height: 30,
        )
      ],
    );
  }
}
