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
  bool checked = false;
  bool correct = false;

  void _onAnswerSelected(int index) {
    if (!checked) {
      setState(() {
        if (selected == index) {
          selected = null;
        } else {
          selected = index;
          if (selected == widget.correct) {
            correct = true;
          }
        }
      });

      // Automatically go to next page after delay (optional)
      // Future.delayed(Duration(seconds: 1), () {
      //   if (widget.onNext != null) {
      //     widget.onNext!();
      //   }
      // });
    }
  }

  Color getButtonColor(int index) {
    if (checked) {
      if (index == widget.correct) return Colors.green;
      if (index == selected) return Colors.red;
    }
    if (index == selected) return Colors.blue;
    return Colors.grey;
  }

  void submitAnswer() {
    setState(() {
      checked = true;
    });
  }

  Color getSuccessColor() {
    return correct ? Colors.green : Colors.red;
  }

  Color getSubmitColor() {
    if (!checked) return Colors.green;
    if (correct) return Colors.green;
    return getSuccessColor();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Transform.translate(
            offset: Offset(0, -kToolbarHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.question, style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                ...List.generate(widget.options.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          side: BorderSide(
                            width: 3.0,
                            color: getButtonColor(index)
                          ),
                          foregroundColor: getButtonColor(index),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        onPressed: () => _onAnswerSelected(index),
                        child: Text(
                          widget.options[index],
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    ),
                  );
                }),
              ]
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: checked ? Theme.of(context).focusColor : null,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Visibility(
                      visible: checked,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4),
                            child: correct
                                ? Icon(Icons.check_circle, color: Colors.green)
                                : Icon(Icons.cancel, color: Colors.red)
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                correct ? "Great work!" : "Incorrect",
                                style: TextStyle(
                                  color: getSuccessColor(),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: checked,
                      child: SizedBox(height: 10),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          backgroundColor: getSubmitColor(),
                          foregroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: checked ? widget.onNext : submitAnswer,
                        child: Text(checked ? "CONTINUE" : "CHECK"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
