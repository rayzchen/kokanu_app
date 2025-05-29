import "package:flutter/material.dart";
import "../widgets/question_card.dart";

class LessonScreen extends StatefulWidget {
  final String title;
  const LessonScreen({super.key, required this.title});

  @override
  LessonScreenState createState() => LessonScreenState();
}

class LessonScreenState extends State<LessonScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (_pageController.page != null && _pageController.page! < 2) {
      _pageController.animateToPage(
        _pageController.page!.toInt() + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: PageView(
        controller: _pageController,
        children: [
          Center(child: ElevatedButton(
            onPressed: goToNextPage,
            child: Text("Go to Question"),
          )),
          QuestionCard(
            question: "Translate: Hello",
            options: ["Hola", "Bonjour", "Kokanu", "Hello"],
            correct: 2,
            onNext: goToNextPage,  // You can pass a callback to move next after answering
          ),
          Center(child: Text("Well done!")),
        ],
      ),
    );
  }
}
