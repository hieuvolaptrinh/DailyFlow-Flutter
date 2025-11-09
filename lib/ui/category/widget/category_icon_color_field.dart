import 'package:flutter/material.dart';

/// Widget để chọn màu cho icon và text của danh mục
/// - Hiển thị tiêu đề "Category Icon & Text Color"
/// - Hiển thị hình tròn màu sắc đã chọn
/// - Callback khi tap vào color picker
class CategoryIconColorField extends StatelessWidget {
  final Color selectedColor;
  final VoidCallback onTap;

  const CategoryIconColorField({
    super.key,
    required this.selectedColor,
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
          _buildFieldTitle("Category Icon & Text Color"),
          // Hình tròn hiển thị màu đã chọn
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(top: 8, right: 8),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36 / 2),
                color: selectedColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build tiêu đề field với styling
  Widget _buildFieldTitle(String title) {
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
