// ignore_for_file: deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/BmiController.dart';
import 'package:velocity_x/velocity_x.dart';

class PrimaryBtn extends StatelessWidget {
  final IconData icon;
  final String btnName;
  final VoidCallback onPressed;

  const PrimaryBtn(
      {super.key,
      required this.icon,
      required this.btnName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Bmicontroller bmicontroller = Get.put(Bmicontroller());

    return Expanded(
      child: InkWell(
          onTap: onPressed,
          child: Obx(
            () => Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: bmicontroller.Gender.value == btnName
                      ? Colors.white
                      : Colors.black,
                  ),

                  btnName.text
                      .letterSpacing(1.5)
                      .xl
                      .bold
                      .color(bmicontroller.Gender.value == btnName
                      ? Colors.white
                      : Colors.black,)
                      .make()
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: bmicontroller.Gender.value == btnName
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
            ),
          )),
    );
  }
}
