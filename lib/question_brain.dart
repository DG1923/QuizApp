import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';

class QuestionBrain {
  late int _indexNumber;
  int get indexNumber => _indexNumber;
  late List<Icon> _scoreKeeper = [];
  late List<Question> _lists =[];
  List<Icon> get scoreKeeper => _scoreKeeper;
  int getLengthListBank()=> _lists.length;
  QuestionBrain(){
    _indexNumber = 0;
    _lists = [
      Question(text: "Trái đất là hình cầu?", answer: true),
      Question(text: "Nước là chất rắn ở nhiệt độ phòng?", answer: false),
      Question(text: "Mặt trời là ngôi sao?", answer: true),
      Question(text: "Có 7 ngày trong một tuần?", answer: true),
      Question(text: "Sắt nặng hơn nước?", answer: true),
      Question(text: "Mặt trăng phát sáng tự nhiên?", answer: false),
      Question(text: "Con người có 5 giác quan?", answer: true),
      Question(text: "Tất cả loài chim đều biết bay?", answer: false),
      Question(text: "Cá sống được trên cạn?", answer: false),
      Question(text: "Kim cương là một dạng của carbon?", answer: true),
      Question(text: "Venus là hành tinh gần mặt trời nhất?", answer: false),
      Question(text: "Một năm có 365 ngày?", answer: true),
      Question(text: "Động vật có xương sống thuộc nhóm Vertebrata?", answer: true),
      Question(text: "Paris là thủ đô của Ý?", answer: false),
      Question(text: "H2O là công thức hóa học của nước?", answer: true),
      Question(text: "Australia nằm ở Châu Á?", answer: false),
      Question(text: "Bão thường xuất hiện vào mùa hè?", answer: true),
      Question(text: "Gấu trúc ăn chủ yếu là tre?", answer: true),
      Question(text: "Titanic là tên của một ngọn núi?", answer: false),
      Question(text: "Einstein phát minh ra bóng đèn?", answer: false),
    ];
  }
  void addQuestion(String txtQuestion, bool answer){
    _lists.add(
      Question(text: txtQuestion, answer: answer),
    );
  }
  bool check(){
    if(_indexNumber + 1 == this.getLengthListBank()){
      return true;
    }else return false;
  }
  String getQuestion(){
    if(this._indexNumber>this.getLengthListBank()-2){
    }else{
      this._indexNumber++;
    }
    return _lists[_indexNumber].questionText;
  }
  void checkAnswer(bool answer){
    if(_lists[_indexNumber].answer == answer){
      this._scoreKeeper.add(
        Icon(
          Icons.check_circle,
          color: Colors.greenAccent,
        ),
      );
    }else{
      this._scoreKeeper.add(
        Icon(
          Icons.cancel,
          color: Colors.redAccent,
        ),
      );
    }
  }

}
