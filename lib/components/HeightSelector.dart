import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/BmiController.dart';


class HeightSelector extends StatefulWidget {
  HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  Bmicontroller bmicontroller = Get.put(Bmicontroller());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 250,
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
              child: SfSlider.vertical(
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
                  setState(() {});
                  bmicontroller.Height.value = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
