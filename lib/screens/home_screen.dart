import "package:flutter/material.dart";
import "../widgets/user_header.dart";
import "../widgets/lesson_path.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          UserHeader(),
          SizedBox(height: 20),
          Text("Your Path", style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 10),
          LessonPath(),
        ],
      ),
    );
  }
}
