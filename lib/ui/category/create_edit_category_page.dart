import 'package:dailyflow/data/model/realm/category_realm_entity.dart';
import 'package:dailyflow/ui/category/widget/category_preview.dart';
import 'package:dailyflow/core/utils/color_extension.dart';
import 'package:dailyflow/viewmodel/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'widget/category_name_field.dart';
import 'widget/category_icon_field.dart';
import 'widget/category_background_color_field.dart';
import 'widget/category_icon_color_field.dart';
import 'widget/category_action_buttons.dart';

class CreateOrEditCategoryPage extends StatefulWidget {
  final String? categoryId;
  const CreateOrEditCategoryPage({super.key, this.categoryId});

  @override
  State<CreateOrEditCategoryPage> createState() =>
      _CreateOrEditCategoryPageState();
}

class _CreateOrEditCategoryPageState extends State<CreateOrEditCategoryPage> {
  final _nameCategoryTextController = TextEditingController(); // để quản lý
  Color _backgroundColorSelected = Colors.white;
  IconData? _iconSlected;
  Color _iconColorSelected = Colors.black;
  // để kiểm tra xem realm đã được lưu hay chưa
  final storagePath = Configuration.defaultStoragePath;

  bool get isEdit {
    return widget.categoryId != null;
  }

  @override
  void dispose() {
    _nameCategoryTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('Realm storage path: $storagePath');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isEdit) {
        _findCategoryById(widget.categoryId!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          isEdit ? "Edit Category" : "Create Category",
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
          CategoryNameField(
            controller: _nameCategoryTextController,
            onChanged: (_) {
              setState(() {});
            },
          ),
          CategoryIconField(selectedIcon: _iconSlected, onTap: _chooseIcon),
          CategoryBackgroundColorField(
            selectedColor: _backgroundColorSelected,
            onTap: _onChooseCategoryBackgroundColor,
          ),

          CategoryIconColorField(
            selectedColor: _iconColorSelected,
            onTap: _onChooseCategoryIconColor,
          ),
          SizedBox(height: 20),
          CategoryPreview(
            colorSelected: _backgroundColorSelected,
            iconSelected: _iconSlected,
            iconColorSelected: _iconColorSelected,
            nameCategoryTextController: _nameCategoryTextController,
          ),
          Spacer(),

          CategoryActionButtons(
            onCancel: () {
              Navigator.pop(context);
            },
            onCreate: isEdit
                ? () async {
                    await _handleEditCategory();
                  }
                : _handleCreateCategory,
            isEdit: isEdit,
          ),
        ],
      ),
    );
  }

  void _handleCreateCategory() async {
    try {
      final categoryName = _nameCategoryTextController.text;

      if (categoryName.isEmpty) {
        return;
      }

      final provider = context.read<CategoryProvider>();

      final success = await provider.createCategory(
        categoryName,
        _backgroundColorSelected.toHex(),
        _iconColorSelected.toHex(),
        _iconSlected?.codePoint,
      );

      if (success) {
        await _showAlert("Success", "Category created successfully!");
        if (context.mounted) {
          Navigator.pop(context, true);
        }
      } else {
        await _showAlert("Fail", "Create Category Failed!");
      }
    } catch (e) {
      await _showAlert("Fail", "Create Category Failed: $e");
    }
  }

  Future<void> _handleEditCategory() async {
    try {
      final categoryName = _nameCategoryTextController.text;

      if (categoryName.isEmpty) {
        return;
      }

      final provider = context.read<CategoryProvider>();

      final success = await provider.updateCategory(
        widget.categoryId!,
        categoryName,
        _backgroundColorSelected.toHex(),
        _iconColorSelected.toHex(),
        _iconSlected?.codePoint,
      );

      if (success) {
        await _showAlert("Success", "Category updated successfully!");
        if (context.mounted) {
          Navigator.pop(context, true);
        }
      } else {
        await _showAlert("Fail", "Update Failed!");
      }
    } catch (e) {
      await _showAlert("Fail", "Update Category Failed: $e");
    }
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
        // cách 2
        return AlertDialog(
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: _backgroundColorSelected,
              onColorChanged: (color) {
                setState(() {
                  _backgroundColorSelected = color;
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
      },
    );
  }

  Future<void> _showAlert(String title, String message) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // logic lấy đữ liệu category từ realm để edit
  void _findCategoryById(String id) {
    final config = Configuration.local([CategoryRealmEntity.schema]);
    final realm = Realm(config);

    final category = realm.find<CategoryRealmEntity>(
      ObjectId.fromHexString(id),
    );
    if (category != null) {
      _nameCategoryTextController.text = category.name;
      if (category.iconCodePoint != null) {
        _iconSlected = IconData(
          category.iconCodePoint!,
          fontFamily: 'MaterialIcons',
        );
      }

      if (category.backgroundColorHex != null) {
        _backgroundColorSelected = HexColor(category.backgroundColorHex!);
      }

      if (category.iconColorHex != null) {
        _iconColorSelected = HexColor(category.iconColorHex!);
      }
    }
    setState(() {});
  }
}
