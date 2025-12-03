import 'package:dailyflow/core/utils/color_extension.dart';
import 'package:dailyflow/data/model/category_model.dart';
import 'package:dailyflow/ui/category/category_list_dialog.dart';
import 'package:dailyflow/core/widget/fied_title.dart';
import 'package:dailyflow/core/widget/category_preview.dart';
import 'package:dailyflow/ui/task_priority/task_priority_list_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _textEditController = TextEditingController();
  CategoryModel? _categorySelected;
  DateTime? _taskDateSelected;
  int? _taskPrioritySelected;
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
            _taskDateSelected != null
                ? _buildTaskDateTime()
                : Text(
                    "Please select date and time",
                    style: TextStyle(color: Colors.white54),
                  ),
            if (_categorySelected != null) _buildTaskCategory(),
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

  //
  Widget _buildTaskDateTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Task time",
          style: TextStyle(fontSize: 18, color: const Color(0xFFAFAFAF)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            DateFormat('dd-MM-yyyy HH:mm').format(_taskDateSelected!),

            style: TextStyle(fontSize: 18, color: const Color(0xFFAFAFAF)),
          ),
        ),
      ],
    );
  }

  //
  Widget _buildTaskCategory() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldTitle(title: "Task Category"),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: CategoryPreview(
            colorSelected: HexColor(
              _categorySelected!.backgroundColorHex ?? "#FFFFFF",
            ),
            iconSelected: IconData(
              _categorySelected!.iconCodePoint ?? Icons.add.codePoint,
              fontFamily: "MaterialIcons",
            ),
            iconColorSelected: HexColor(
              _categorySelected!.iconColorHex ?? "#FFFFFF",
            ),
            nameCategoryTextController: TextEditingController(
              text: _categorySelected!.name,
            ),
          ),
        ),
      ],
    );
  }

  //
  Widget _buildTaskActionField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              // Hẹn giờ
              IconButton(
                onPressed: () {
                  _selectTaskTime();
                },
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
                onPressed: () {
                  _showDiaLogChoosePriority();
                },
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

  void _showDiaLogChoosePriority() async {
    // hứng context từ cái dialog nó trả về
    final result = await showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) {
        return TaskPriorityListDialog();
      },
    );

    print(result);

    if (result != null && result is Map<String, dynamic>) {
      final priority = result['priority'] as int;
      setState(() {
        _taskPrioritySelected = priority;
      });
    }
  }

  void _showDiaLogChooseCategory() async {
    // hứng context từ cái dialog nó trả về
    final result = await showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) {
        return CategoryListDialog();
      },
    );
    print(result);

    if (result != null && result is Map<String, dynamic>) {
      final categoryId = result['categoryId'] as String;
      if (categoryId.isEmpty) {
        return;
      }
      final name = result['name'] as String;
      final iconCodePoint = result['iconCodePoint'] as int;
      final backgroundColorHex = result['backgroundColorHex'] as String;
      final iconColorHex = result['iconColorHex'] as String;

      final category = CategoryModel(
        id: categoryId,
        name: name,
        iconCodePoint: iconCodePoint,
        backgroundColorHex: backgroundColorHex,
        iconColorHex: iconColorHex,
      );

      setState(() {
        _categorySelected = category;
      });
    }
  }

  void _selectTaskTime() async {
    // nếu muốn chọn cả giờ thì dùng showTimePicker

    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFF8687E7),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      return null;
    }

    if (!context.mounted) {
      return;
    }
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFF8687E7),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (time == null) return;

    // kết hợp ngày và giờ lại với nhau

    final dateTimeSelected = date?.copyWith(
      hour: time.hour,
      minute: time.minute,
      second: 0,
    );

    setState(() {
      _taskDateSelected = dateTimeSelected;
    });
  }
}
