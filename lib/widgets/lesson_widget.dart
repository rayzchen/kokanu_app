import "package:flutter/material.dart";
import "../screens/lesson_screen.dart";

class LessonWidget extends StatelessWidget {
  final String title;

  const LessonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.book),
        title: Text(title),
        trailing: Icon(Icons.lock_open),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LessonScreen(title: title)),
        ),
      ),
    );
  }
}
