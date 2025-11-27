import 'package:dailyflow/core/widget/fied_title.dart';
import 'package:flutter/material.dart';

/// Widget để nhập tên danh mục
/// - Hiển thị tiêu đề "Category Name"
/// - TextFormField nhập tên
class CategoryNameField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CategoryNameField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề field
          FieldTitle(title: "Category Name"),
          // TextFormField nhập tên
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              onChanged: (String value) {
                onChanged?.call(value);
              },
              controller: controller,

              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(136, 255, 255, 255),
              ),
              decoration: InputDecoration(
                hintText: "Category Name",
                hintStyle: TextStyle(
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
}
