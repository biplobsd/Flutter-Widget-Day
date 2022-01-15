import 'package:flutter/material.dart';
import 'package:justquiz/quizData.dart';

import 'quizScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int score = 0;
  int questionIndex = 0;
  void nextQuestion() {
    setState(() {
      if (quizData.length - 1 > questionIndex) {
        questionIndex += 1;
      } else {
        questionIndex = -1;
      }
    });
  }

  void addScore(int score) {
    this.score += score;
    nextQuestion();
  }

  void reset() {
    score = 0;
    questionIndex = 0;
    nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Just Quiz"),
        ),
        body: (questionIndex != -1)
            ? QuizScreen(questionIndex, addScore)
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Done!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Your Score is $score"),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      child: const Text("Restart"),
                      onPressed: reset,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
