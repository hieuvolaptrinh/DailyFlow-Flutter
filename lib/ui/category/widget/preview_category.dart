import 'package:flutter/material.dart';

class PreviewCategory extends StatelessWidget {
  final Color colorSelected;
  final IconData? iconSelected;
  final Color iconColorSelected;
  final TextEditingController nameCategoryTextController; // để quản lý
  const PreviewCategory({
    super.key,
    required this.colorSelected,
    required this.iconSelected,
    required this.iconColorSelected,
    required this.nameCategoryTextController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colorSelected,
            ),
            child: Icon(iconSelected, color: iconColorSelected, size: 20),
          ),
          Text(
            nameCategoryTextController.text,
            style: TextStyle(fontSize: 14, color: iconColorSelected),
          ),
        ],
      ),
    );
  }
}
