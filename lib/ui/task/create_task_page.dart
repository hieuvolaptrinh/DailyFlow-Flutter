import 'package:dailyflow/ui/category/category_list_page.dart';
import 'package:dailyflow/core/widget/fied_title.dart';
import 'package:flutter/material.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF363636),
      child: SafeArea(child: Container(child: _buildBodyPage())),
    );
  }

  Widget _buildBodyPage() {
    return Form(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTaskNameField(),
            _buildTaskDescriptionField(),
            _buildTaskActionField(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskNameField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldTitle(title: "Add Task"),

        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16),
          child: TextFormField(
            onChanged: (String value) {},
            controller: _textEditController,

            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(136, 255, 255, 255),
            ),
            decoration: InputDecoration(
              hintText: "Add your task here",
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
    );
  }

  Widget _buildTaskDescriptionField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldTitle(title: "Description Task"),

        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16),
          child: TextFormField(
            onChanged: (String value) {},
            controller: _textEditController,

            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(136, 255, 255, 255),
            ),
            decoration: InputDecoration(
              hintText: "Enter task description here",
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
    );
  }

  Widget _buildTaskActionField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              // Hẹn giờ
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.timer,
                  size: 24,
                  color: Colors.orangeAccent, // nổi bật
                ),
                tooltip: 'Set timer',
              ),
              SizedBox(width: 8),

              // Gắn nhãn
              IconButton(
                onPressed: () {
                  _showDiaLogChooseCategory();
                },
                icon: Icon(
                  Icons.tag,
                  size: 24,
                  color: Colors.blueAccent, // xanh dương nhẹ
                ),
                tooltip: 'Add tag',
              ),
              SizedBox(width: 8),

              // Cờ ưu tiên
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.flag,
                  size: 24,
                  color: Colors.redAccent, // biểu tượng cảnh báo
                ),
                tooltip: 'Mark priority',
              ),
            ],
          ),
        ),

        // Nút gửi
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.send,
            size: 24,
            color: Colors.greenAccent, // màu hoàn tất
          ),
          tooltip: 'Send',
        ),
      ],
    );
  }

  void _showDiaLogChooseCategory() {
    showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) {
        return CategoryListPage();
      },
    );
  }
}
