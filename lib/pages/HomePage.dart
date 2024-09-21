// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/AgeSelector.dart';
import '../components/HeightSelector.dart';
import '../components/HeightSelector_feet.dart';
import '../components/PrimaryBtn.dart';
import '../components/RactBtn.dart';
import '../components/SecoundaryBtn.dart';
import '../components/ThemeChangerBtn.dart';
import '../components/WeightSelector.dart';
import '../controllers/BmiController.dart';
import '../controllers/ThemeControler.dart';
import 'ResultPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Themecontroler themecontroler = Get.put(Themecontroler());
    Bmicontroller bmicontroller = Get.put(Bmicontroller());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ThemeChangeBtn(),
              Row(
                children: [
                  "Welcome to"
                      .text
                      .xl
                      .color(Theme.of(context).colorScheme.onSecondaryContainer)
                      .make(),
                ],
              ),
              Row(
                children: [
                  "EASY BMI 😊"
                      .text
                      .xl4
                      .color(Theme.of(context).colorScheme.onSurface)
                      .bold
                      .make(),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  PrimaryBtn(
                      onPressed: () {
                        bmicontroller.genderHandle("MALE");
                      },
                      icon: Icons.male,
                      btnName: "MALE"),
                  SizedBox(width: 10),
                  PrimaryBtn(
                      onPressed: () {
                        bmicontroller.genderHandle("FEMALE");
                      },
                      icon: Icons.female,
                      btnName: "FEMALE")
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
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
                              children: [
                                bmicontroller.heightUnit.value == "CM"
                                    ? HeightSelector() // CM height selector
                                    : HeightSelectorFeet(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Secoundarybtn(
                                          onPressed: () {
                                            setState(() {});
                                            bmicontroller.heightUnit.value =
                                                "CM";
                                          },
                                          btnName: "CM"),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Secoundarybtn(
                                          onPressed: () {
                                            setState(() {});
                                            bmicontroller.heightUnit.value =
                                                "FT";
                                            bmicontroller.Height.value = 120.0;
                                          },
                                          btnName: "FT"),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                          SizedBox(width: 10),
                          !context.isMobile
                              ? Container(
                                  width: 250,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      WeightSelector(),
                                      SizedBox(height: 10),
                                      AgeSelector(),
                                    ],
                                  ),
                                )
                              : Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      WeightSelector(),
                                      SizedBox(height: 10),
                                      AgeSelector()
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyRactBtn(
                        onPressed: () {
                          bmicontroller.CalculateBMI();
                          Get.to(ResultPage());
                        },
                        icon: Icons.done_all_rounded,
                        btnName: "Let's Go!")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
