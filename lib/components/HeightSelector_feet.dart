import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp/controllers/BmiController.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:velocity_x/velocity_x.dart';

class HeightSelectorFeet extends StatefulWidget {
  HeightSelectorFeet({super.key});

  @override
  State<HeightSelectorFeet> createState() => _HeightSelectorFeetState();
}

class _HeightSelectorFeetState extends State<HeightSelectorFeet> {
  Bmicontroller bmicontroller = Get.put(Bmicontroller());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Height"
                    .text
                    .color(Theme.of(context).colorScheme.onSecondaryContainer)
                    .make(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                "Feet"
                    .text
                    .color(Theme.of(context).colorScheme.onSecondaryContainer)
                    .make(),
                "Inches"
                    .text
                    .color(Theme.of(context).colorScheme.onSecondaryContainer)
                    .make(),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => SfSlider.vertical(
                        min: 0.0,
                        max: 10.0,
                        value: bmicontroller.Feet.value,
                        interval: 1,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        tooltipPosition: SliderTooltipPosition.right,
                        minorTicksPerInterval: 5,
                        inactiveColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (dynamic value) {
                          bmicontroller.Feet.value = value;
                        },
                      ),
                    ),
                    Obx(() => SfSlider.vertical(
                      min: 0.0,
                      max: 11.0,
                      value: bmicontroller.Ince.value,
                      interval: 1,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 5,
                      inactiveColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (dynamic value) {
                        bmicontroller.Ince.value = value;
                      },
                    ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
