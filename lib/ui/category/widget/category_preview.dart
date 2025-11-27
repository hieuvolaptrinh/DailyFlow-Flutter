import 'package:flutter/material.dart';
import 'package:dailyflow/core/widget/fied_title.dart';

class CategoryPreview extends StatelessWidget {
  final Color colorSelected;
  final IconData? iconSelected;
  final Color iconColorSelected;
  final TextEditingController nameCategoryTextController; // để quản lý
  const CategoryPreview({
    super.key,
    required this.colorSelected,
    required this.iconSelected,
    required this.iconColorSelected,
    required this.nameCategoryTextController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // FieldTitle(title: "Preview Category"),
          Flexible(
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorSelected,
              ),
              child: Icon(iconSelected, color: iconColorSelected, size: 30),
            ),
          ),
          SizedBox(height: 4),
          Flexible(
            child: Text(
              nameCategoryTextController.text.isEmpty
                  ? "Category"
                  : nameCategoryTextController.text,
              style: TextStyle(fontSize: 12, color: iconColorSelected),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
