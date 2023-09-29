import 'package:flutter/material.dart';
import 'package:screen_recorder/screen_recorder.dart';
import 'package:white_board_application/models/dynamic_offset_ponints_model.dart';

mixin WhiteBoardBehaviour {
  List<DynamicOffsetPointsModel?> dyamicOffsetPointsModel = [];
}
ScreenRecorderController screenRecorderController = ScreenRecorderController();
bool isClear = false;
bool isRemoveLast = false;
double sliderValue = 0.5;
Color colorValue = Colors.black;
