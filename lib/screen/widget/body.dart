import 'package:flutter/material.dart';

class ReusableBody extends StatelessWidget {
  final Widget child;

  const ReusableBody({required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: child,
    );
  }
}
