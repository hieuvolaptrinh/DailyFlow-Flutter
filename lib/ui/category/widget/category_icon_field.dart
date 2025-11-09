import 'package:dailyflow/ui/widget/fied_title.dart';
import 'package:flutter/material.dart';

/// Widget để chọn icon cho danh mục
/// - Hiển thị tiêu đề "Choose Icon"
/// - Button hiển thị icon đã chọn hoặc text hướng dẫn
/// - Callback khi chọn icon
class CategoryIconField extends StatelessWidget {
  final IconData? selectedIcon;
  final VoidCallback onTap;

  const CategoryIconField({
    super.key,
    required this.selectedIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề field
          FieldTitle(title: "Choose Icon"),
          // Button chọn icon
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xFFFFFFFF).withOpacity(0.21),
              ),
              // Nếu đã chọn icon thì hiển thị icon, không thì hiển thị text hướng dẫn
              child: selectedIcon != null
                  ? Icon(selectedIcon, color: Colors.white, size: 26)
                  : Text(
                      "Category Icon from library",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
