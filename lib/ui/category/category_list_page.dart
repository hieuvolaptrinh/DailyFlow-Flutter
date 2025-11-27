import 'package:dailyflow/data/model/category.dart';
import 'package:dailyflow/data/model/realm/category_realm_entity.dart';
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
  List<Category> _listCategoryDataSource = [];

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
        final category = _listCategoryDataSource.elementAt(index);
        return CategoryPreview(
          colorSelected: Colors.blue,
          iconSelected: IconData(category.iconCodePoint ?? Icons.add.codePoint),
          iconColorSelected: Colors.white,
          nameCategoryTextController: TextEditingController(
            text: category.name,
          ),
        );
      },
      // 10 items with 3 columns
      itemCount: _listCategoryDataSource.length,
    );
  }

  Widget _buildCategoryButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8875FF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: Text(
          "Add Category",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // lấy từ realm như cái sql lite vậy ấy
  Future<void> _getCategoryList() async {
    final config = Configuration.local([CategoryRealmEntity.schema]);
    final realm = Realm(config);

    // convert categoryRealmEntity to category
    final categories = realm.all<CategoryRealmEntity>();

    List<Category> listCategory = categories.map((e) {
      return Category(
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
}
