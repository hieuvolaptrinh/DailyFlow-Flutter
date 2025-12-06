import 'package:dailyflow/core/utils/color_extension.dart';
import 'package:dailyflow/data/model/category_model.dart';
import 'package:dailyflow/ui/category/category_list_dialog.dart';
import 'package:dailyflow/core/widget/fied_title.dart';
import 'package:dailyflow/ui/task_priority/task_priority_list_dialog.dart';
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTaskNameField(),
              SizedBox(height: 16),
              _buildTaskDescriptionField(),
              SizedBox(height: 16),
              _buildTaskActionField(),
              SizedBox(height: 16),
              // Preview các thông tin đã chọn
              if (_taskDateSelected != null) _buildTaskDateTime(),
              if (_categorySelected != null) _buildTaskCategory(),
              if (_taskPrioritySelected != null) _buildTaskPriority(),
            ],
          ),
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

  Widget _buildTaskDateTime() {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF8687E7), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.orangeAccent, size: 20),
              SizedBox(width: 10),
              Text(
                DateFormat('dd MMM yyyy, HH:mm').format(_taskDateSelected!),
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
          Icon(Icons.check_circle, color: Colors.greenAccent, size: 20),
        ],
      ),
    );
  }

  Widget _buildTaskCategory() {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF8687E7), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.tag, color: Colors.blueAccent, size: 20),
              SizedBox(width: 10),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: HexColor(
                    _categorySelected!.backgroundColorHex ?? "#FFFFFF",
                  ),
                ),
                child: Icon(
                  IconData(
                    _categorySelected!.iconCodePoint ?? Icons.add.codePoint,
                    fontFamily: "MaterialIcons",
                  ),
                  color: HexColor(_categorySelected!.iconColorHex ?? "#FFFFFF"),
                  size: 18,
                ),
              ),
              SizedBox(width: 10),
              Text(
                _categorySelected!.name,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
          Icon(Icons.check_circle, color: Colors.greenAccent, size: 20),
        ],
      ),
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

    if (date == null) {
      return;
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

    final dateTimeSelected = date.copyWith(
      hour: time.hour,
      minute: time.minute,
      second: 0,
    );

    setState(() {
      _taskDateSelected = dateTimeSelected;
    });
  }

  Widget _buildTaskPriority() {
    String priorityLabel = '';
    Color priorityColor = Colors.white;

    switch (_taskPrioritySelected) {
      case 1:
        priorityLabel = 'Low Priority';
        priorityColor = Colors.greenAccent;
        break;
      case 2:
        priorityLabel = 'Medium Priority';
        priorityColor = Colors.orangeAccent;
        break;
      case 3:
        priorityLabel = 'High Priority';
        priorityColor = Colors.redAccent;
        break;
      default:
        priorityLabel = 'Not Set';
    }

    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF8687E7), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.flag, color: Colors.redAccent, size: 20),
              SizedBox(width: 10),
              Text(
                priorityLabel,
                style: TextStyle(
                  fontSize: 14,
                  color: priorityColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Icon(Icons.check_circle, color: Colors.greenAccent, size: 20),
        ],
      ),
    );
  }
}
