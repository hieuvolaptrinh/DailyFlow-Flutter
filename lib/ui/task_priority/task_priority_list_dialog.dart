import 'package:flutter/material.dart';

class TaskPriorityListDialog extends StatefulWidget {
  const TaskPriorityListDialog({super.key});

  @override
  State<TaskPriorityListDialog> createState() => _TaskPriorityListDialogState();
}

class _TaskPriorityListDialogState extends State<TaskPriorityListDialog> {
  List<int> priorityListDataSource = [];
  int? _selectPriority;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildBodyPage(),
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      priorityListDataSource = List.generate(10, (index) => index + 1);
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
            _buildChoosePriorityTitle(),
            _buildGridPriorityList(),
            _buildCreatePriorityButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildChoosePriorityTitle() {
    return Column(
      children: [
        Text(
          "Edit Task Priority",
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

  Widget _buildGridPriorityList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final priority = index + 1;
        final isSelected = _selectPriority == priority;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectPriority = priority;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected
                  ? const Color(0xFF8875FF)
                  : const Color(0xFF2C2C2C),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF8875FF)
                    : const Color(0xFF3C3C3C),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.flag,
                  color: isSelected ? Colors.white : Colors.white54,
                  size: 28,
                ),
                const SizedBox(height: 4),
                Text(
                  '$priority',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }

  Widget _buildCreatePriorityButton() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          // Nút Cancel
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
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
                Navigator.pop(context, {"priority": _selectPriority});
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
                _selectPriority == null ? "Select Priority" : "Confirm",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
