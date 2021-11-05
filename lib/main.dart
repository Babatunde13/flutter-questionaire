import 'package:flutter/material.dart';
import 'text.dart';
import './input_text.dart';
import './utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var answers = userAnswers();
  var questions = userQuestions();
  var _questionIdx = 0;
  var _buttonText = 'Next Question>';
  var _answer = '';
  var _errorMessage = '';

  void _answerQuestion() {
    if (_answer == '') {
      setState(() {
        _errorMessage = 'Please select an answer';
      });
    } else if (answers[_questionIdx]?.contains(_answer.toUpperCase())
        as bool) {
      if (questions.length > _questionIdx + 1) {
        setState(() {
          _questionIdx++;
          _buttonText = 'Next Question>';
          _answer = '';
          _errorMessage = '';
        });
      } else {
        setState(() {
          _buttonText = 'Restart';
          _questionIdx = 0;
          _errorMessage = '';
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Please select a valid answer';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text('Hello Flutter'),
          toolbarHeight: 20.4,
          leadingWidth: 45,
        ),
        body: Column(
          children: <Widget>[
            if (_errorMessage != '')
              TextWidget(
                text: '* $_errorMessage',
                color: Colors.red,
                fontSize: 10,
              ),
            TextWidget(text: questions[_questionIdx]),
            InputTextWidget(
                onChanged: (String value) {
                  setState(() {
                    _answer = value;
                  });
                },
                placeholder: 'Enter your answer here'),
            ElevatedButton(
              child: Text(_buttonText),
              onPressed: _answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
