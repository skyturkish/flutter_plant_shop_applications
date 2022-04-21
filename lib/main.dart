import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/views/welcomepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      title: 'Material App',
      home: MainPage(),
    );
  }
}



