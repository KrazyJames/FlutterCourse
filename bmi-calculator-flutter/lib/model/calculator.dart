import 'dart:math';

class Calculator {
  final int weight;
  final int height;
  double _bmi;

  Calculator({this.weight, this.height});

  void calculate(){
    _bmi = weight.toDouble() / pow(height.toDouble()/100, 2);
  }

  String getBMI(){
    return _bmi.toStringAsFixed(1);
  }

  String getState(){
    if (_bmi >= 25){
      return 'OVERWEIGHT';
    }else if (_bmi >= 18.5){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }

  String getAdvice(){
    if (_bmi >= 25){
      return 'You should pass over pancakes and workout your body.';
    }else if (_bmi >= 18.5){
      return 'Keep it in your way, just stay healthy and you will be ok.';
    }else{
      return 'You need to eat more and healthy, be careful with your body.';
    }
  }

}