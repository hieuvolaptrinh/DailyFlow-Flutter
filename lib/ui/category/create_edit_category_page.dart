import 'package:dailyflow/ui/category/widget/preview_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'widget/category_name_field.dart';
import 'widget/category_icon_field.dart';
import 'widget/category_background_color_field.dart';
import 'widget/category_icon_color_field.dart';
import 'widget/category_action_buttons.dart';

class CreateOrEditCategoryPage extends StatefulWidget {
  const CreateOrEditCategoryPage({super.key});

  @override
  State<CreateOrEditCategoryPage> createState() =>
      _CreateOrEditCategoryPageState();
}

class _CreateOrEditCategoryPageState extends State<CreateOrEditCategoryPage> {
  final _nameCategoryTextController = TextEditingController(); // để quản lý
  Color _colorSelected = Colors.white;

  IconData? _iconSlected;
  Color _iconColorSelected = Colors.black;

  @override
  void dispose() {
    _nameCategoryTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          "Create or Edit Category",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _buildBodyPageScreen(),
    );
  }

  /// Build body chính của trang
  /// Cấu trúc:
  /// - CategoryNameField: Widget con để nhập tên category
  /// - CategoryIconField: Widget con để chọn icon
  /// - CategoryBackgroundColorField: Widget con để chọn màu nền
  /// - CategoryIconColorField: Widget con để chọn màu icon
  /// - Spacer: Khoảng cách tự động
  /// - CategoryActionButtons: Widget con cho 2 nút hành động
  Widget _buildBodyPageScreen() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryNameField(controller: _nameCategoryTextController),
          CategoryIconField(selectedIcon: _iconSlected, onTap: _chooseIcon),
          CategoryBackgroundColorField(
            selectedColor: _colorSelected,
            onTap: _onChooseCategoryBackgroundColor,
          ),

          CategoryIconColorField(
            selectedColor: _iconColorSelected,
            onTap: _onChooseCategoryIconColor,
          ),
          PreviewCategory(
            colorSelected: _colorSelected,
            iconSelected: _iconSlected,
            iconColorSelected: _iconColorSelected,
            nameCategoryTextController: _nameCategoryTextController,
          ),
          Spacer(),

          CategoryActionButtons(
            onCancel: () {
              // TODO: Xử lý cancel
            },
            onCreate: _handleCreateCategory,
          ),
        ],
      ),
    );
  }

  // sự kiện, vứt ra ngoài cho dễ nhìn
  void _handleCreateCategory() {
    final categoryName = _nameCategoryTextController.text;
    print("Create Category: $categoryName");
  }

  // đã thêm thư viện flutter_iconpicker: ^4.0.1 nên có thể chọn icon
  void _chooseIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(
      context,
      iconPackModes: [IconPack.material],
    );

    setState(() {
      _iconSlected = icon;
    });
  }

  // choose color của background category
  void _onChooseCategoryBackgroundColor() async {
    showDialog(
      context: context,
      builder: (context) {
        // cách 1
        // return AlertDialog(
        //   content: SingleChildScrollView(
        //     child: ColorPicker(
        //       pickerColor: _colorSelected,
        //       onColorChanged: (color) {
        //         setState(() {
        //           _colorSelected = color;
        //         });
        //       },
        //     ),
        //   ),
        // );

        // cách 2
        return AlertDialog(
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: _colorSelected,
              onColorChanged: (color) {
                setState(() {
                  _colorSelected = color;
                });
              },
            ),
          ),
        );
      },
    );
  }

  // chose icon color
  void _onChooseCategoryIconColor() async {
    showDialog(
      context: context,
      builder: (context) {
        // cách 1
        return AlertDialog(
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _iconColorSelected,
              onColorChanged: (color) {
                setState(() {
                  _iconColorSelected = color;
                });
              },
            ),
          ),
        );

        // cách 2
        //   return AlertDialog(
        //     content: SingleChildScrollView(
        //       child: MaterialPicker(
        //         pickerColor: _iconColorSelected,
        //         onColorChanged: (color) {
        //           setState(() {
        //             _iconColorSelected = color;
        //           });
        //         },
        //       ),
        //     ),
        //   );
      },
    );
  }
}
