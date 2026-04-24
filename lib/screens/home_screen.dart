import 'package:flutter/material.dart';
import '../models/app_theme.dart';
import '../models/bmi_model.dart';
import '../widgets/glass_card.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 170;
  double weight = 70;
  int age = 25;
  String gender = 'Male';
  
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    heightController = TextEditingController(text: height.toString());
    weightController = TextEditingController(text: weight.toString());
    ageController = TextEditingController(text: age.toString());
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void _calculateBMI() {
    // Parse and validate inputs
    final heightValue = double.tryParse(heightController.text);
    final weightValue = double.tryParse(weightController.text);
    final ageValue = int.tryParse(ageController.text);

    if (heightValue == null || heightValue < 100 || heightValue > 250) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid height (100-250 cm)')),
      );
      return;
    }

    if (weightValue == null || weightValue < 20 || weightValue > 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid weight (20-200 kg)')),
      );
      return;
    }

    if (ageValue == null || ageValue < 1 || ageValue > 120) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid age (1-120)')),
      );
      return;
    }

    final bmi = BMIModel.calculate(weightValue, heightValue);
    final model = BMIModel(
      bmi: bmi,
      height: heightValue,
      weight: weightValue,
      age: ageValue,
      gender: gender,
      calculatedAt: DateTime.now(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen(bmiModel: model)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.bgGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  'BMI Calculator',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Check your Body Mass Index',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                ),                const SizedBox(height: 12),
                Text(
                  'Roll No : 160124737203',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.accent,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Name : Vadlagatta Rajaneesh Netha',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.accent,
                  ),
                ),                const SizedBox(height: 24),

                // ─── Gender Selection ───
                Text(
                  'Select Gender',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.textPrimary,
                      ),
                ),
                const SizedBox(height: 8),
                Row(
                    children: [
                      Expanded(
                        child: GlassCard(
                          selected: gender == 'Male',
                          onTap: () => setState(() => gender = 'Male'),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          child: Text(
                            'Male',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GlassCard(
                          selected: gender == 'Female',
                          onTap: () => setState(() => gender = 'Female'),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          child: Text(
                            'Female',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 20),

                // ─── Height Input ───
                Text(
                  'Height (cm)',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.textPrimary,
                      ),
                ),
                const SizedBox(height: 12),
                GlassCard(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: heightController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.textPrimary,
                        ),
                    decoration: InputDecoration(
                      hintText: 'Enter height',
                      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppTheme.cardBorder,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppTheme.cardBorder,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppTheme.accent,
                              width: 2,
                            ),
                          ),
                          suffixText: 'cm',
                          suffixStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppTheme.accent,
                              ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                const SizedBox(height: 16),

                // ─── Weight & Age ───
                Row(
                    children: [
                      Expanded(
                        child: GlassCard(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weight (kg)',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppTheme.textSecondary,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: weightController,
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppTheme.textPrimary,
                                    ),
                                decoration: InputDecoration(
                                  hintText: 'Weight',
                                  hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: AppTheme.textSecondary,
                                      ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GlassCard(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Age',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppTheme.textSecondary,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: ageController,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppTheme.textPrimary,
                                    ),
                                decoration: InputDecoration(
                                  hintText: 'Age',
                                  hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: AppTheme.textSecondary,
                                      ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 24),

                // ─── Calculate Button ───
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _calculateBMI,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                    ),
                    child: Text(
                      'Calculate BMI',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
