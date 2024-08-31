import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bmicontroller extends GetxController {
  RxString Gender = "MALE".obs;
  RxString heightUnit = "CM".obs;

  RxInt Weight = 45.obs;
  RxInt Age = 18.obs;
  RxDouble Feet = 5.0.obs;
  RxDouble Ince = 5.0.obs;
  RxDouble Height = 120.0.obs;
  RxDouble BMI = 0.0.obs;
  RxString BMIStaus = "".obs;
  Rx<Color> colorStatus = Color(0xff246AFE).obs;

  void genderHandle(String gender) {
    Gender.value = gender;
  }
  void lenghtHandle(String lenght) {
    heightUnit.value = lenght;
  }


  void CalculateBMI() {
    // Convert feet and inches to total centimeters
    if(Height.value>120){
      var HeightInMeters = Height.value / 100;
      BMI.value = Weight.value / (HeightInMeters * HeightInMeters);
    } else {
      var totalCm = Feet.value * 30.48 + Ince.value * 2.54;
      // Convert total centimeters to meters
      var HeightInMeters = totalCm / 100.0;
      BMI.value = Weight.value / (HeightInMeters * HeightInMeters);
    }
    // BMI calculation


    FindStatus();
    print(BMI.value);
  }

  void FindStatus() {
    if (BMI.value < 18.5) {
      BMIStaus.value = "UnderWeight";
      colorStatus.value = Color.fromARGB(255, 255, 160, 59);
    } else if (BMI.value >= 18.5 && BMI.value <= 24.9) {
      BMIStaus.value = "Normal";
      colorStatus.value = Colors.green;
    } else if (BMI.value >= 25 && BMI.value <= 29.9) {
      BMIStaus.value = "OverWeight";
      colorStatus.value = Colors.orange;
    } else if (BMI.value >= 30 && BMI.value <= 39.9) {
      BMIStaus.value = "Obese";
      colorStatus.value = const Color.fromARGB(255, 227, 76, 76);
    } else {
      BMIStaus.value = "Extremely Obese";
      colorStatus.value = const Color.fromARGB(255, 248, 21, 4);
    }
  }
}
