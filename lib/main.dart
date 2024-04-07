import 'package:flutter/material.dart';
import 'package:quizzical/quiz_brain.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(const Quizzler()); //void main runs stateless widget

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quizzical'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPageHome(), //calling stateful widget
          ),
        ),
      ),
    );
  }
} //stateless widget runs stateful widget

class QuizPageHome extends StatefulWidget {
  const QuizPageHome({super.key});

  @override
  State<QuizPageHome> createState() => _QuizPageHomeState();
}

class _QuizPageHomeState extends State<QuizPageHome> {
  //VARIABLES
  Icon iconTrue = const Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon iconFalse = const Icon(
    Icons.close,
    color: Colors.red,
  );

  QuizBrain quizBrain = QuizBrain();

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool? correctAnswer = quizBrain.getQuestionAnswer();
    if (correctAnswer == userPickedAnswer) {
      scoreKeeper.add(iconTrue);
    } else {
      scoreKeeper.add(iconFalse);
    }
    setState(() {
      quizBrain.nextQuestion(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          //QUESTIONS
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ), //QUESTIONS
        Expanded(
          //TRUE
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ), //TRUE
        Expanded(
          //FALSE
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ), //FALSE
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
