import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:screen_recorder/screen_recorder.dart';
import 'package:white_board_application/controller/statemanagement/undocontroller.dart';
import 'package:white_board_application/controller/white_board_behaviour.dart';
import 'package:white_board_application/models/dynamic_offset_ponints_model.dart';
import 'package:white_board_application/widgets/drawer_header.dart';
import 'package:white_board_application/widgets/white_board_paint.dart';

class HomePageViewPage extends StatefulWidget {
  const HomePageViewPage({super.key});

  @override
  State<HomePageViewPage> createState() => _HomePageViewPageState();
}

class _HomePageViewPageState extends State<HomePageViewPage>
    with WhiteBoardBehaviour {
  late double width;
  late double height;
  UndoControllers undoController = Get.put(UndoControllers());
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white54,
        child: DrawerHeader(
          child: CustomDrawerWidget(),
        ),
      ),
      appBar: AppBar(
        title: const Text('White board'),
        actions: [
          // IconButton(
          //   onPressed: () async {
          //     ui.Image? image = screenRecorderController.capture();
          //     ByteData? data = await image!.toByteData();
          //     Uint8List intListImage = data!.buffer.asUint8List();
          //     screenRecorderController.exporter.clear();
          //     String imageString = base64Encode(intListImage);
          //   },
          //   icon: const Icon(Icons.file_upload_outlined),
          // ),
          IconButton(
            onPressed: () {
              setState(() {
                isRemoveLast = true;
              });
            },
            icon: const Icon(Icons.undo),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isClear = true;
              });
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: GestureDetector(
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: ScreenRecorder(
          height: height,
          width: width,
          controller: screenRecorderController,
          child: CustomPaint(
            painter:
                WhiteBoardPainter(dynamicOffsetPonis: dyamicOffsetPointsModel),
            child: SizedBox(
              width: width,
              height: height,
            ),
          ),
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    if (kDebugMode) {
      print('user started drawing');
    }

    setState(() {
      final box = context.findRenderObject() as RenderBox;
      final ponits = box.globalToLocal(details.localPosition);

      dyamicOffsetPointsModel.add(DynamicOffsetPointsModel(offset: ponits));
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (kDebugMode) {
      print('on pan update is called');
    }
    setState(() {
      final box = context.findRenderObject() as RenderBox;
      Offset points = box.globalToLocal(details.localPosition);
      if (points >= Offset.zero && points <= Offset(width, height)) {
        dyamicOffsetPointsModel.add(DynamicOffsetPointsModel(offset: points));
      } else {
        dyamicOffsetPointsModel.add(null);
      }
    });
  }

  void onPanEnd(DragEndDetails details) {
    if (kDebugMode) {
      print('user end painting');
    }
    setState(() {
      dyamicOffsetPointsModel.add(null);
    });
  }
}
