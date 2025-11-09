import 'package:flutter/material.dart';

/// Widget để nhập tên category
/// Tách ra từ CreateOrEditCategory để dễ bảo trì và tái sử dụng
class CategoryNameField extends StatelessWidget {
  final TextEditingController controller;

  const CategoryNameField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle("Category Name"),
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              controller: controller,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(136, 255, 255, 255),
              ),
              decoration: InputDecoration(
                hintText: "Category Name",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color(0xFF979797),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget chung để hiển thị tiêu đề của các field
  Widget _buildFieldTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
