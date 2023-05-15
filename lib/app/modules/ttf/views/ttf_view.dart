import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:get/get.dart';

import '../controllers/ttf_controller.dart';

class TtfView extends GetView<TtfController> {
  const TtfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FlutterTts ftts = FlutterTts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TtfView'),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                controller.scheduleNotificationWithSpeech(
                    'Learn As Much As Possible');
              },
              child: const Text('Play'))),
    );
  }
}
