import 'package:flutter/material.dart';
import 'package:jenosize/screen/homepage.dart';
import 'package:jenosize/screen/jenosizeLocation.dart';
import 'package:jenosize/screen/searchScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jenosize Restaurant Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/jenosize_location': (context) => JenosizeLocation(),
        '/SearchPage': (context) => SearchPage(),
      },
    );
  }
}
