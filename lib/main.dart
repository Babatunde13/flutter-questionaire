import 'package:flutter/material.dart';
import 'text.dart';
import './input_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
        
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIdx = 0;
  var _buttonText = 'Next Question>';
  var _answer = '';
  var _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    const questions = [
      "What's your favorite color?",
      "What's your favorite pet?",
      "What's your favorite city?",
    ];
    const answers = {
      0: ['YELLOW', 'BLACK', 'RED', 'GREEN'],
      1: ['DOG', 'CAT', 'RABBIT', 'SNAKE'],
      2: [
        'LONDON', 'PARIS', 'NEW YORK', 'TOKYO', 'ROME',
        'BERLIN', 'MADRID', 'MOSCOW', 'SEOUL', 'BEIJING',
        'SHANGHAI', 'SYDNEY', 'MELBOURNE', 'SAO PAULO',
        'BEUNUS AIRES', 'CAIRO', 'LAGOS', 'KINSHASA', 'JOHANNESBURG',
        'CAPE TOWN', 'DURBAN', 'KHARTOUM', 'NAIROBI', 'ADDIS ABABA',
        'ACCRA', 'TUNIS', 'DAKAR',
      ]
    };
    void _answerQuestion() {
      if (_answer == '') {
        setState(() {
          _errorMessage = 'Please select an answer';
        });
      }
      else if ( answers[_questionIdx]?.contains(_answer.toUpperCase()) as bool) {
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
            TextWidget(
              text: _errorMessage != '' ? '* $_errorMessage' : '',
              color: Colors.red,
              fontSize: 10,
            ),
            // Text(
            //   _errorMessage != '' ? '* $_errorMessage' : '',
            //   style: TextStyle(
            //     color: Colors.red,
            //     fontSize: 10,
            //   ),
            // ),
            TextWidget(text: questions[_questionIdx]),
            InputTextWidget(
              onChanged: (String value) {
                setState(() {
                  _answer = value;
                });
              },
              placeholder: 'Enter your answer here'
            ),
            // TextField(
            //   onChanged: (String value) {
            //     setState(() {
            //       _answer = value;
            //     });
            //   },
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: 'Enter your answer here',
            //   ),
            // ),
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
