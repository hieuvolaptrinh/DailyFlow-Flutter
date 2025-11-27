import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  final String title;

  const FieldTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
