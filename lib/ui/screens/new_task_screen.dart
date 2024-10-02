import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import '../widget/task_card.dart';
import '../widget/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildSummarySection(),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const TaskCard();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTabAddFAB,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildSummarySection() {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TaskSummaryCard(
              count: 99,
              title: 'New',
            ),
            TaskSummaryCard(
              count: 99,
              title: 'Completed',
            ),
            TaskSummaryCard(
              count: 99,
              title: 'Cancelled',
            ),
            TaskSummaryCard(
              count: 99,
              title: 'Progress',
            ),
          ],
        ),
      ),
    );
  }

  void _onTabAddFAB() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTaskScreen(),
      ),
    );
  }
}
