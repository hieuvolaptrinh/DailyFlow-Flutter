import 'package:dailyflow/core/utils/color_extension.dart';
import 'package:dailyflow/data/model/category_model.dart';
import 'package:dailyflow/data/model/realm/category_realm_entity.dart';
import 'package:dailyflow/ui/category/create_edit_category_page.dart';
import 'package:dailyflow/ui/category/widget/category_action_buttons.dart';
import 'package:dailyflow/ui/category/widget/category_grid_item.dart';
import 'package:dailyflow/ui/category/widget/category_preview.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<CategoryModel> _listCategoryDataSource = [];
  bool _isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildBodyPage(),
    );
  }

  // init state khi khởi tạo
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCategoryList();
    });
  }

  Widget _buildBodyPage() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xFF363636),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildChooseCategoryTitle(),
            _buildGridCategoryList(),
            _buildCategoryButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildChooseCategoryTitle() {
    return Column(
      children: [
        Text(
          "Choose Category",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        const Divider(color: Color(0xff97979797)),
      ],
    );
  }

  Widget _buildGridCategoryList() {
    return GridView.builder(
      // fix cứng height width theo content
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // 3 cột
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final isLastItem = index == _listCategoryDataSource.length;
        if (isLastItem) {
          return _createNewCategoryButton();
        }
        final category = _listCategoryDataSource.elementAt(index);
        return GestureDetector(
          onTap: () {
            if (_isEditMode) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateOrEditCategoryPage(),
                ),
              );
            } else {
              Navigator.pop(context, {
                "categoryId": category.id,
                "name": category.name,
                "iconCodePoint": category.iconCodePoint,
                "backgroundColorHex": category.backgroundColorHex,
                "iconColorHex": category.iconColorHex,
              });
            }
          },
          child: CategoryPreview(
            colorSelected: HexColor(category.backgroundColorHex ?? "#FFFFFF"),
            iconSelected: IconData(
              category.iconCodePoint ?? Icons.add.codePoint,
              fontFamily: "MaterialIcons",
            ),
            iconColorSelected: HexColor(category.iconColorHex ?? "#FFFFFF"),
            nameCategoryTextController: TextEditingController(
              text: category.name,
            ),
            isEditMode: _isEditMode,
          ),
        );
      },
      // 10 items with 3 columns
      itemCount: _listCategoryDataSource.length + 1,
    );
  }

  Widget _buildCategoryButton() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          // Nút Cancel / Back
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                // TODO: xử lý khi bấm Cancel
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: const BorderSide(color: Color(0xFF8875FF)),
                foregroundColor: const Color(0xFF8875FF),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isEditMode = !_isEditMode;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8875FF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                _isEditMode ? "Cancel Edit" : "Edit Categories",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // lấy từ realm như cái sql lite vậy ấy
  Future<void> _getCategoryList() async {
    final config = Configuration.local([CategoryRealmEntity.schema]);
    final realm = Realm(config);

    // convert categoryRealmEntity to category
    final categories = realm.all<CategoryRealmEntity>();

    List<CategoryModel> listCategory = categories.map((e) {
      return CategoryModel(
        id: e.id.hexString,
        name: e.name,
        iconCodePoint: e.iconCodePoint,
        backgroundColorHex: e.backgroundColorHex,
        iconColorHex: e.iconColorHex,
      );
    }).toList();

    setState(() {
      _listCategoryDataSource = listCategory;
    });
  }

  Widget _createNewCategoryButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateOrEditCategoryPage(),
          ),
        );
      },
      child: Container(
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
                  color: const Color.fromARGB(255, 0, 177, 3),
                ),
                child: Icon(
                  Icons.add,
                  color: const Color.fromARGB(255, 0, 54, 6),
                  size: 30,
                ),
              ),
            ),
            SizedBox(height: 4),
            Flexible(
              child: Text(
                "Add Category",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
