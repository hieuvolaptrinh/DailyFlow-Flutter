import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class CreateOrEditCategory extends StatefulWidget {
  const CreateOrEditCategory({super.key});

  @override
  State<CreateOrEditCategory> createState() => _CreateOrEditCategoryState();
}

class _CreateOrEditCategoryState extends State<CreateOrEditCategory> {
  final _nameCategoryTextController = TextEditingController(); // để quản lý
  List<Color> _colorDataSource = [];
  Color _colorSelected = Colors.white;

  IconData? _iconSlected;

  @override
  void dispose() {
    _nameCategoryTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _colorDataSource = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.brown,
      Colors.deepOrangeAccent,
      const Color.fromARGB(255, 255, 247, 0),
    ];
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

  Widget _buildBodyPageScreen() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryNameField(),
          _buildCategoryChooseIconField(),
          _buildCategoryChooseBackgroundColorField(),
          Spacer(),
          _buildCreateAndCancelButtons(context),
        ],
      ),
    );
  }

  Widget _buildCategoryNameField() {
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
              controller: _nameCategoryTextController,
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

  Widget _buildCategoryChooseIconField() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle("Choose Icon "),
          GestureDetector(
            onTap: () {
              _chooseIcon();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xFFFFFFFF).withOpacity(0.21),
              ),

              child: _iconSlected != null
                  ? Icon(_iconSlected, color: Colors.white, size: 26)
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

  Widget _buildCategoryChooseBackgroundColorField() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle("Category Color"),
          GestureDetector(
            // là widget bọc lại để lắng nghe sự kiện của người dùng thôi
            onTap: () => _onChooseCategoryBackgroundColor(),
            child: Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36 / 2),

                color: _colorSelected ?? Colors.white,
              ),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 8),
          //   width: double.infinity,
          //   height: 36,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       // các biến chức năng
          //       final color = _colorDataSource.elementAt(index);
          //       bool isSelected = colorSelected == color;
          //       return GestureDetector(
          //         onTap: () {
          //           // check
          //           print(" chooses color $index");
          //           // set state để build lại giao diện khi thay đổi nhé
          //           setState(() {
          //             colorSelected = color;
          //           });
          //         },
          //         child: Container(
          //           width: 36,
          //           height: 36,
          //           margin: const EdgeInsets.only(right: 8),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(36 / 2),
          //             border: Border.all(
          //               width: isSelected ? 3 : 2,
          //               color: isSelected
          //                   ? const Color.fromARGB(255, 255, 0, 0)
          //                   : Colors.white54,
          //             ),
          //             color: color,
          //           ),
          //           child: isSelected
          //               ? const Icon(Icons.check, color: Colors.white)
          //               : null,
          //         ),
          //       );
          //     },
          //     itemCount: _colorDataSource.length,
          //   ),
          // ),
        ],
      ),
    );
  }

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

  Widget _buildCreateAndCancelButtons(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // căn 2 nút 2 bên
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              context.tr('common_cancel'),
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 26,
                color: Colors.grey,
              ),
            ),
          ),
          const Spacer(), // hoặc xài thằng Expanded để bọc lại các phần trong row hoặc column để chiếm hết khoản trống còn lại trong khung nhìn
          ElevatedButton(
            onPressed: () {
              _handleCreateCategory();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8875FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              "Create Category",
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
}
