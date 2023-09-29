import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:white_board_application/controller/white_board_behaviour.dart';
import 'package:white_board_application/models/dynamic_offset_ponints_model.dart';

class WhiteBoardPainter extends CustomPainter with WhiteBoardBehaviour {
  List<Offset> offsetPoints = [];
  List<DynamicOffsetPointsModel?> dynamicOffsetPonis;
  WhiteBoardPainter({required this.dynamicOffsetPonis});
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = sliderValue * 5;
    Paint paint = Paint()
      ..color = colorValue
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..blendMode;
    if (dynamicOffsetPonis.isNotEmpty) {
      if (isRemoveLast) {
        if (dynamicOffsetPonis.isNotEmpty) {
          print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
          for (var i = 0; i < dynamicOffsetPonis.length - 1; i++) {
            dynamicOffsetPonis.removeAt(i);
          }
          
          isRemoveLast = false;
        } else {
          return;
        }
      }
      for (var i = 0; i < dynamicOffsetPonis.length - 1; i++) {
        if (dynamicOffsetPonis[i] != null &&
            dynamicOffsetPonis[i + 1] != null) {
          if (isClear) {
            print('calledddddddddddddddddddddd');
            offsetPoints.clear();
            dynamicOffsetPonis.clear();
            isClear = false;
          } else {
            canvas.drawLine(dynamicOffsetPonis[i]!.offset,
                dynamicOffsetPonis[i + 1]!.offset, paint);
          }
        } else if (dynamicOffsetPonis[i] != null &&
            dynamicOffsetPonis[i + 1] == null) {
          print('???????????????????????????????');
          offsetPoints.clear();
          offsetPoints.add(dynamicOffsetPonis[i]!.offset);
          offsetPoints.add(Offset(dynamicOffsetPonis[i]!.offset.dx + 0.1,
              dynamicOffsetPonis[i]!.offset.dy + 0.1));
          canvas.drawPoints(PointMode.points, offsetPoints, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(WhiteBoardPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(WhiteBoardPainter oldDelegate) =>
      offsetPoints != oldDelegate.offsetPoints;
}
