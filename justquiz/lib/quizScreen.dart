import 'package:flutter/material.dart';
import 'package:justquiz/quizData.dart';

class QuizScreen extends StatelessWidget {
  final int questionIndex;
  final Function addScore;
  const QuizScreen(this.questionIndex, this.addScore, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            quizData[questionIndex]['question'].toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          ...(quizData[questionIndex]['Answare'] as List)
              .map(
                (e) => SizedBox(
                  width: 320,
                  child: ElevatedButton(
                    child: Text(e['option']),
                    onPressed: () {
                      addScore(e['score']);
                    },
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
