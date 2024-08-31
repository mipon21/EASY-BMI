// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:myapp/config/Colors.dart';

var lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      background: LBgColor,
      primary: LPrimaryColor,
      onBackground: LFontColor,
      primaryContainer: LDivColor,
      onPrimaryContainer: LFontColor,
      onSecondaryContainer: LLabelColor,
    ));
var darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      background: DBgColor,
      primary: DPrimaryColor,
      onBackground: DFontColor,
      primaryContainer: DDivColor,
      onPrimaryContainer: DFontColor,
      onSecondaryContainer: DLabelColor,
    ));
