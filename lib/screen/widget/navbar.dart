import 'package:flutter/material.dart';

class ReusableNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final Function(int) onTap;

  ReusableNavBar({required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/search');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/jenosize_location');
        }
      },
    );
  }
}
