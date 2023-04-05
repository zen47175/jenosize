// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jenosize Restaurant Finder'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset('assets/1990225859.jpeg')),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/SearchPage');
                    },
                    child: const Text(
                      'ค้นหาร้าน',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/jenosize_location');
                    },
                    child: const Text(
                      'แผนที่บริษัท',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: ReusableNavBar(
      //   items: [
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'ค้นหาร้าน',
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.map),
      //       label: 'แผนที่บริษัท',
      //     ),
      //   ],
      //   onTap: (index) {
      //     if (index == 1) {
      //       Navigator.pushNamed(context, '/jenosize_location');
      //     }
      //   },
      // ),
    );
  }
}
