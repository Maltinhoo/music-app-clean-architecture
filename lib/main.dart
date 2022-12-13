import 'package:flutter/material.dart';
import 'package:music_app/core/inject/intect.dart';

void main() {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      // home: HomePage(),
    );
  }
}
