import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Widget chứa 2 nút hành động: Cancel và Create Category
/// - Cancel: TextButton, có callback onCancel
/// - Create Category: ElevatedButton, có callback onCreate
class CategoryActionButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onCreate;
  final bool isEdit;
  const CategoryActionButtons({
    super.key,
    required this.onCancel,
    required this.onCreate,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Nút Cancel - TextButton
          TextButton(
            onPressed: onCancel,
            child: Text(
              context.tr('common_cancel'),
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 26,
                color: Colors.grey,
              ),
            ),
          ),
          const Spacer(),
          // Nút Create Category - ElevatedButton
          ElevatedButton(
            onPressed: onCreate,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8875FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              isEdit ? "Edit Category" : "Create Category",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
