import 'package:bmi_calculator/common/custom_card.dart';
import 'package:bmi_calculator/common/my_filled_button.dart';
import 'package:bmi_calculator/controller/home_controller.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blueAccent),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.blueAccent, fontWeight: FontWeight.bold),
      ),
      body: Obx(() => SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                // Gender selection row
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomCard(
                          onTap: () => controller.selectGender(true),
                          color: controller.maleColor.value.withOpacity(0.85),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male, size: 48, color: Colors.white),
                              const SizedBox(height: 8),
                              Text('MALE', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, letterSpacing: 1.5)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomCard(
                          onTap: () => controller.selectGender(false),
                          color: controller.femaleColor.value.withOpacity(0.85),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female, size: 48, color: Colors.white),
                              const SizedBox(height: 8),
                              Text('FEMALE', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, letterSpacing: 1.5)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Height card
                Expanded(
                  child: CustomCard(
                    color: Theme.of(context).cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT', style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 1.5, color: Colors.white)),
                        const SizedBox(height: 12),
                        Obx(() => Text(
                              controller.heightInCm.value.toString() + ' cm',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        const SizedBox(height: 12),
                        Obx(() => Slider(
                              value: controller.heightInCm.value.toDouble(),
                              min: 80,
                              max: 220,
                              divisions: 140,
                              activeColor: Colors.blueAccent,
                              inactiveColor: Colors.white24,
                              onChanged: (value) {
                                controller.heightInCm.value = value.round();
                              },
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Age and Weight row
                Expanded(
                  child: Row(
                    children: [
                      // Age Card
                      Expanded(
                        child: CustomCard(
                          color: Theme.of(context).cardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('AGE', style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 1.5, color: Colors.white)),
                              const SizedBox(height: 12),
                              Obx(() => Text(
                                    controller.ageInYears.value.toString() + ' yrs',
                                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              const SizedBox(height: 12),
                              Obx(() => Slider(
                                    value: controller.ageInYears.value.toDouble(),
                                    min: 5,
                                    max: 100,
                                    divisions: 95,
                                    activeColor: Colors.blueAccent,
                                    inactiveColor: Colors.white24,
                                    onChanged: (value) {
                                      controller.ageInYears.value = value.round();
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Weight Card
                      Expanded(
                        child: CustomCard(
                          color: Theme.of(context).cardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('WEIGHT', style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 1.5, color: Colors.white)),
                              const SizedBox(height: 12),
                              Obx(() => Text(
                                    controller.weightInKg.value.toString() + ' kg',
                                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              const SizedBox(height: 12),
                              Obx(() => Slider(
                                    value: controller.weightInKg.value.toDouble(),
                                    min: 10,
                                    max: 200,
                                    divisions: 190,
                                    activeColor: Colors.blueAccent,
                                    inactiveColor: Colors.white24,
                                    onChanged: (value) {
                                      controller.weightInKg.value = value.round();
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Calculate Button
                MyFilledButton(
                  onPressed: () {
                    controller.calculateBmi();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => ResultBottomSheet(
                        bmi: controller.result.value,
                        age: controller.ageInYears.value,
                        weight: controller.weightInKg.value,
                        height: controller.heightInCm.value,
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Text(
                    'Calculate BMI',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Add more dark styling if your MyFilledButton supports it
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      )),
    );
  }
}