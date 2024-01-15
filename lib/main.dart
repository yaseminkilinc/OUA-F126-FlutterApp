import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/calculate.dart';
import 'package:bmi_calculator_app/advice.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double height = 0;
  double weight = 0;
  String advice = '';
  String gender = 'Male'; // Cinsiyet seçeneği için varsayılan değer "Erkek" olarak belirleyelim.

  double calculateBMI() {
    CalculateBMI bmiCalculator = CalculateBMI();
    bmiCalculator.height = height;
    bmiCalculator.weight = weight;
    bmiCalculator.gender = gender;

    return bmiCalculator.calculate();
  }

  void updateAdvice() {
    double bmi = calculateBMI();
    if (gender == 'Male') {
      if (bmi < 20) {
        advice = 'Underweight';
      } else if (bmi >= 20 && bmi < 25) {
        advice = 'Normal weight';
      } else if (bmi >= 25 && bmi < 32) {
        advice = 'Overweight';
      } else {
        advice = 'Obese';
      }
    } else {
      if (bmi < 18.5) {
        advice = 'Underweight';
      } else if (bmi >= 18.5 && bmi < 24) {
        advice = 'Normal weight';
      } else if (bmi >= 24 && bmi < 30) {
        advice = 'Overweight';
      } else {
        advice = 'Obese';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Master'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text('Male', style: TextStyle(color: Colors.black)),
                Radio<String>(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                Text('Female', style: TextStyle(color: Colors.black)),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  height = double.parse(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  weight = double.parse(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  updateAdvice();
                });
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Calculate',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your BMI: ${calculateBMI().toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 8.0),
            AdviceWidget(advice: advice),
          ],
        ),
      ),
    );
  }
}







