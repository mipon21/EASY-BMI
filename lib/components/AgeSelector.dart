import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/SecBtn.dart';
import 'package:myapp/controllers/BmiController.dart';
import 'package:velocity_x/velocity_x.dart';

class AgeSelector extends StatelessWidget {
  const AgeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    Bmicontroller bmicontroller = Get.put(Bmicontroller());
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Age"
                    .text
                    .color(Theme.of(context).colorScheme.onSecondaryContainer)
                    .make(),
              ],
            ),
            Expanded(
              child: !context.isMobile ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => "${bmicontroller.Age.value}"
                          .text
                          .size(55)
                          .bold
                          .color(Theme.of(context).colorScheme.onSurface)
                          .make())
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SecBtn(onPressed: (){
                        bmicontroller.Age.value++;
                      }, icon: Icons.add),
                      SizedBox(width: 10),
                      SecBtn(onPressed: (){
                        bmicontroller.Age.value--;
                      }, icon: Icons.remove)
                    ],)
                ],
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => "${bmicontroller.Age.value}"
                          .text
                          .size(55)
                          .bold
                          .color(Theme.of(context).colorScheme.onSurface)
                          .make())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SecBtn(onPressed: (){
                        bmicontroller.Age.value++;
                      }, icon: Icons.add),
                      SizedBox(width: 10),
                      SecBtn(onPressed: (){
                        bmicontroller.Age.value--;
                      }, icon: Icons.remove)
                    ],)
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}