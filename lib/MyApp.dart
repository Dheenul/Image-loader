import 'package:flutter/material.dart';
import 'HomePage.dart';
class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return (
      MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          colorSchemeSeed: Color(0xff0D031B)
        ),
        debugShowCheckedModeBanner: false,
        home:HomePage(),
      )
    );
  }
}
