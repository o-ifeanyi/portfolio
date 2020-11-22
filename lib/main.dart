import 'package:flutter/material.dart';
import './screens/initial_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        accentColor: Color(0xFF464EA8),
        scaffoldBackgroundColor: Color(0xFF141414),
        backgroundColor: Color(0xFF1B1A1A),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          bodyText1: TextStyle(fontWeight: FontWeight.w500),
          bodyText2: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      home: InitialRoute(),
    );
  }
}
