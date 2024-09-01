import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp/components/HeightSelector_feet.dart';
import 'package:myapp/controllers/BmiController.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:velocity_x/velocity_x.dart';

import 'SecoundaryBtn.dart';

class HeightSelector extends StatelessWidget {
  HeightSelector({super.key});
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
                "Height (CM)"
                    .text
                    .color(Theme.of(context).colorScheme.onSecondaryContainer)
                    .make(),
              ],
            ),
            Expanded(
                child: Obx(
              () => SfSlider.vertical(
                min: 120.0,
                max: 250.0,
                value: bmicontroller.Height.value,
                interval: 25,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                minorTicksPerInterval: 5,
                inactiveColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.2),
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (dynamic value) {
                  bmicontroller.Height.value = value;
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
