import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class FuelCalc extends StatelessWidget {
  const FuelCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xffF8FAFC)
      ),
      home: HomeScreen(),
    );
  }
}
