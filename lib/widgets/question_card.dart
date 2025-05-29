import "package:flutter/material.dart";

class QuestionCard extends StatefulWidget {
  final String question;
  final List<String> options;
  final int correct;
  final VoidCallback? onNext;

  const QuestionCard({super.key, required this.question, required this.options, required this.correct, this.onNext});

  @override
  QuestionCardState createState() => QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {
  int? selected;

  void _onAnswerSelected(int index) {
    setState(() {
      selected = index;
    });

    // Automatically go to next page after delay (optional)
    Future.delayed(Duration(seconds: 1), () {
      if (widget.onNext != null) {
        widget.onNext!();
      }
    });
  }

  Color getButtonColor(int index) {
    print("Selected: $selected, Index: $index");
    if (selected == null) return Colors.blue;
    if (index == widget.correct) return Colors.green;
    if (index == selected) return Colors.red;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.question, style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          ...List.generate(widget.options.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(getButtonColor(index)),
                  foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: selected == null
                    ? () => _onAnswerSelected(index)
                    : null,
                child: Text(widget.options[index]),
              ),
            );
          }),
        ],
      ),
    );
  }
}
