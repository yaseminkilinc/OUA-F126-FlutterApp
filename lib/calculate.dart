
class CalculateBMI {
  double height = 0;
  double weight = 0;
  String gender = 'Male';

  double calculate() {
    double bmi = 0;
    // Cinsiyete göre hesaplama yapalım.
    if (height > 0 && weight > 0) {
      if (gender == 'Male') {
        // Erkek için BMI hesaplaması
        bmi = weight / ((height / 100) * (height / 100));
      } else {
        bmi = weight / ((height / 100) * (height / 100));
      }
    }
    return bmi;
  }
}
