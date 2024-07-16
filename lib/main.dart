import 'package:flutter/material.dart';
import 'package:quizzapp/question_brain.dart';
import 'package:quickalert/quickalert.dart';
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Quizz App"),

      ),
      backgroundColor: Colors.grey.shade900,
      body: QuizzApp(),
    ),
  ));
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({super.key});

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  void alert(BuildContext context){
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Bạn đã hoàn thành tất cả câu hỏi !!!',
      confirmBtnText: "Được nha",
    );
  }
  QuestionBrain questionBrain = new QuestionBrain();
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Center(
              child: Text(
                questionBrain.getQuestion(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 0),
            child: ElevatedButton(
              onPressed: () {
                if(questionBrain.check()){
                  alert(context);
                } else{
                  this.setState(() {
                    questionBrain.checkAnswer(true);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(double.infinity, double.infinity),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: Colors.green,
              ),
              child: Center(
                child: Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 0),
            child: ElevatedButton(
              onPressed: () {
                if(questionBrain.check()){
                  alert(context);
                }else{
                  this.setState(() {
                    questionBrain.checkAnswer(false);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(double.infinity, double.infinity),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: Colors.redAccent,
              ),
              child: Center(
                child: Text(
                  'No',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: questionBrain.scoreKeeper,
        )
      ],
    );
  }
}
