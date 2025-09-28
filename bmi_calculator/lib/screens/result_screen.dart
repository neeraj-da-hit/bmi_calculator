import 'package:flutter/material.dart';

class ResultBottomSheet extends StatelessWidget {
  final int bmi;
  final int age;
  final int weight;
  final int height;

  const ResultBottomSheet({
    super.key,
    required this.bmi,
    required this.age,
    required this.weight,
    required this.height,
  });

  String getBmiCategory(int bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  Color getCategoryColor(BuildContext context, int bmi) {
    if (bmi < 18.5) return Colors.amberAccent;
    if (bmi < 25) return Colors.greenAccent;
    if (bmi < 30) return Colors.orangeAccent;
    return Colors.redAccent;
  }

  String getHealthTip(int bmi) {
    if (bmi < 18.5) return 'You are underweight. Consider a nutritious diet and consult a doctor.';
    if (bmi < 25) return 'Great! You have a normal BMI. Maintain your healthy lifestyle.';
    if (bmi < 30) return 'You are overweight. Try to exercise regularly and eat healthy.';
    return 'You are obese. Please consult a healthcare provider for advice.';
  }

  @override
  Widget build(BuildContext context) {
    final category = getBmiCategory(bmi);
    final categoryColor = getCategoryColor(context, bmi);
    final tip = getHealthTip(bmi);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 6,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          Text(
            'Your BMI Result',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.monitor_weight, color: categoryColor, size: 40),
              const SizedBox(width: 12),
              Text(
                bmi.toString(),
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: categoryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            category,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: categoryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _InfoTile(label: 'Age', value: age.toString()),
              _InfoTile(label: 'Weight', value: '$weight kg'),
              _InfoTile(label: 'Height', value: '$height cm'),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: categoryColor),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    tip,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Recalculate'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  const _InfoTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white60),
        ),
      ],
    );
  }
}
