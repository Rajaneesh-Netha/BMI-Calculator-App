import 'package:flutter/material.dart';
import '../models/app_theme.dart';
import '../models/bmi_model.dart';
import '../widgets/glass_card.dart';

class ResultScreen extends StatelessWidget {
  final BMIModel bmiModel;

  const ResultScreen({super.key, required this.bmiModel});

  @override
  Widget build(BuildContext context) {
    final categoryColor = AppTheme.categoryColor(bmiModel.category);
    final categoryEmoji = AppTheme.categoryEmoji(bmiModel.category);
    final categoryGradient = AppTheme.categoryGradient(bmiModel.category);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.bgGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ─── Header ───
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppTheme.textPrimary),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Your Result',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: AppTheme.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
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
                ),
                const SizedBox(height: 18),

                // ─── BMI Display Card ───
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: categoryGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: categoryColor.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        categoryEmoji,
                        style: const TextStyle(fontSize: 64),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        bmiModel.category,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        bmiModel.bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'kg/m²',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white70,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // ─── Input Details ───
                Text(
                  'Your Details',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: GlassCard(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Height',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppTheme.textSecondary,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${bmiModel.height.toStringAsFixed(1)} cm',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppTheme.accent,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GlassCard(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weight',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppTheme.textSecondary,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${bmiModel.weight.toStringAsFixed(1)} kg',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppTheme.accent,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GlassCard(
                          padding: const EdgeInsets.all(14),
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
                              Text(
                                '${bmiModel.age}',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppTheme.accent,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // ─── BMI Range Bar ───
                Text(
                  'BMI Range',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.cardBorder),
                  ),
                  child: Column(
                    children: [
                      // BMI Scale Bar
                      Row(
                        children: [
                          // Underweight
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                color: AppTheme.underweight,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '<18.5',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          // Normal
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              color: AppTheme.normal,
                              child: Center(
                                child: Text(
                                  '18.5-24.9',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          // Overweight
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              color: AppTheme.overweight,
                              child: Center(
                                child: Text(
                                  '25-29.9',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          // Obese
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                color: AppTheme.obese,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '30+',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Legend
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Your BMI: ${bmiModel.bmi.toStringAsFixed(1)}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: categoryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            bmiModel.category,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: categoryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // ─── Advice ───
                GlassCard(
                  padding: const EdgeInsets.all(20),
                  borderColor: categoryColor.withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '💡 Advice',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppTheme.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        bmiModel.advice,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.textSecondary,
                              height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // ─── Recalculate Button ───
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                    ),
                    child: Text(
                      'Recalculate',
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
