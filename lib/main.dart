import 'package:flutter/material.dart';

import 'constants.dart';
import 'screens/main_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static int pgIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'MaliciousWeb Checker',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: bgColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: pgIndex,
          children: const [
            MainScreen(),
            AboutScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pgIndex,
          backgroundColor: const Color(0xFF006D46),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Montserrat',
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Montserrat',
          ),
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              label: 'About',
              icon: Icon(Icons.info_rounded),
            ),
          ],
          onTap: (int val) {
            setState(() => pgIndex = val);
          },
        ),
      ),
    );
  }
}
