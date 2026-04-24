class BMIModel {
  final double bmi;
  final double height; // in cm
  final double weight; // in kg
  final int age;
  final String gender;
  final DateTime calculatedAt;

  BMIModel({
    required this.bmi,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.calculatedAt,
  });

  String get category {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25.0) return 'Normal';
    if (bmi < 30.0) return 'Overweight';
    return 'Obese';
  }

  String get advice {
    switch (category) {
      case 'Underweight':
        return 'Consider a nutrient-rich diet and consult a dietitian to gain healthy weight.';
      case 'Normal':
        return 'Great! Maintain your current lifestyle with regular exercise and balanced diet.';
      case 'Overweight':
        return 'Consider increasing physical activity and reducing calorie intake gradually.';
      case 'Obese':
        return 'Consult a healthcare professional for a personalized weight loss plan.';
      default:
        return '';
    }
  }

  /// Returns a value 0.0 – 1.0 mapped to the gauge (BMI 10 → 40)
  double get gaugeValue => ((bmi - 10) / 30).clamp(0.0, 1.0);

  static double calculate(double weightKg, double heightCm) {
    final heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
  }

  Map<String, dynamic> toMap() => {
        'bmi': bmi,
        'height': height,
        'weight': weight,
        'age': age,
        'gender': gender,
        'calculatedAt': calculatedAt.toIso8601String(),
      };

  factory BMIModel.fromMap(Map<String, dynamic> map) => BMIModel(
        bmi: map['bmi'],
        height: map['height'],
        weight: map['weight'],
        age: map['age'],
        gender: map['gender'],
        calculatedAt: DateTime.parse(map['calculatedAt']),
      );
}
