import 'package:flutter/material.dart';

class AdviceWidget extends StatelessWidget {
  final String advice;

  // Constructor aracılığıyla "advice" değerini alır.
  AdviceWidget({required this.advice});

  @override
  Widget build(BuildContext context) {
    // Tavsiye metnini gösteren bir widget döndürülür.
    return Container(
      decoration: BoxDecoration(
        color: _getAdviceColor(), // Tavsiye rengini belirler.
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Advice:', // Başlık metni
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            _getAdviceText(), // Tavsiye metni
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // BMI'ye göre farklı renkte bir arkaplan rengi döndürür.
  Color _getAdviceColor() {
    if (advice == 'Underweight') {
      return Colors.blue;
    } else if (advice == 'Normal weight') {
      return Colors.green;
    } else if (advice == 'Overweight') {
      return Colors.orange;
    } else if(advice == 'Obese'){
      return Colors.red;
    }else{
      return Colors.grey;
    }
  }

  // BMI'ye göre tavsiye metnini döndürür.
  String _getAdviceText() {
    if (advice == 'Underweight') {
      return 'You are underweight!! You should make sure you eat enough energy to gain weight, protein to repair your body and build your muscles, and vitamins and minerals to make you healthy. You can put on weight by eating small meals frequently throughout the day. Try to snack on healthy, high energy foods like cheese, nuts, milk-based smoothies and dried fruit.';
    } else if (advice == 'Normal weight') {
      return 'Congratulations! You have a normal weight. Keep up the good work!';
    } else if (advice == 'Overweight') {
      return 'You are overweight! You have to watch what you eat. You should stay away from ready-made foods and exercise frequently. You should pay attention to egg consumption. You should exercise proportionally to what you eat. Pay attention to healthy eating!';
    } else if (advice == 'Obese') {
      return 'You are obese. It is important to seek advice from a healthcare professional.';
    }else{
      return 'Please enter values!';
    }
  }
}
