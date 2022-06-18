import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print("hey");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: Column(children: [
          Text(""),
          ElevatedButton(
            onPressed: answerQuestion,
            child: Text("Answer 1"),
          ),
          ElevatedButton(
            onPressed: () => {
              print("hey 2"),
            },
            child: Text("Answer 2"),
          ),
          ElevatedButton(
            onPressed: answerQuestion,
            child: Text("Answer 3"),
          ),
        ]),
      ),
    );
  }
}
