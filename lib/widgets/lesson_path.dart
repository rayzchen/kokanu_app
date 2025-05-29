import "package:flutter/material.dart";
import "lesson_widget.dart";

class LessonPath extends StatelessWidget {
  final List<String> lessons = const ["Basics 1", "Basics 2", "Phrases", "Food"];

  const LessonPath({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: lessons.map((lesson) => LessonWidget(title: lesson)).toList(),
    );
  }
}
