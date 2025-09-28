import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {

  var heightInCm = 0.obs;
  var weightInKg = 0.obs;
  var ageInYears = 0.obs;
  var result = 0.obs;
  var maleColor = Rx<Color>(Colors.blue);
  var femaleColor = Rx<Color>(Colors.blueGrey);

  void calculateBmi () {
    if (heightInCm.value > 0 && weightInKg.value > 0) {
      double heightInMeters = heightInCm.value / 100;
      double bmi = weightInKg.value / (heightInMeters * heightInMeters);
      result.value = bmi.round();
    } else {
      result.value = 0;
    }
  }
  void selectGender(bool isMale) {
    if (isMale) {
      maleColor.value = Colors.blue;
      femaleColor.value = Colors.blueGrey;
    } else {
      maleColor.value = Colors.blueGrey;
      femaleColor.value = Colors.blue;
    }
  }
}