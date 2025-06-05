import 'dart:math';
class Logic{
  Logic({this.height,this.weight});
  final height;
  final weight;
  double _bmi=0;

  String calculateBMI(){
    _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String interpretation(){
    if(_bmi>=25){
      return "You are above the healthy weight range for your height, which could increase the risk of conditions like high blood pressure, type 2 diabetes, and cardiovascular disease.";
    }else if(_bmi>18){
      return "Your weight is within a healthy range for your height. This suggests a balanced relationship between body mass and height, reducing risk of chronic diseases.";
    }else{
      return "You are below the recommended weight for your height, which might signal nutritional deficiencies or underlying health issues";
    }
  }
  String bmiCategory(){
    if(_bmi>=25){
      return "OVER WEIGHT";
    }else if(_bmi>=18){
      return "NORMAL";
    }else{
      return 'UNDER-WEIGHT';
    }
  }
}