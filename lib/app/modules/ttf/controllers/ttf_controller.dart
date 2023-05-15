import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz1;

class TtfController extends GetxController {
  //TODO: Implement TtfController
  final FlutterTts flutterTts = FlutterTts();
  final count = 0.obs;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    initializeNotifications();
  }

  Future<void> initializeNotifications() async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleNotificationWithSpeech(String? text) async {
    print("Hellp");
    String? path = await synthesizeTextToAudioFile(flutterTts, text!);
    if (path == null) {
      // print('null null$path');
      return;
    }
    // print('null$path');
    var androidSettings = const AndroidNotificationDetails(
        'channel_id', 'channel_name',
        channelDescription: 'Try to Notify My User',
        playSound: true,
        priority: Priority.max,
        sound: UriAndroidNotificationSound(
            'file:///storage/self/primary/Android/data/com.example.untitled/files/notification_sound.mp3'));

    var platformSettings = NotificationDetails(android: androidSettings);

    var scheduledDate = DateTime.now().add(Duration(seconds: 10));

    ///Time Add Korte Hobe
    tz1.initializeTimeZones();
    await flutterLocalNotificationsPlugin.zonedSchedule(0, 'Notification Title',
        'Hi', tz.TZDateTime.from(scheduledDate, tz.local), platformSettings,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<String?> synthesizeTextToAudioFile(
      FlutterTts flutterTts, String text) async {
    print("xxc");
    Directory? directory = await getExternalStorageDirectory();
    print("appDocumentsDirectory${directory?.path}");
    String file = "notification_sound.mp3";
    //print(path);
    // print("path: $path");

    await flutterTts.synthesizeToFile(text, file);

    // Future.delayed( Duration(minutes:4 ), () {
    //   // deleayed code here
    //   //return File(path).existsSync() ? path : null;
    //   scheduleNotificationWithSpeech(File(path).existsSync() ? path: null);
    //
    // });
    print('Shantoasdasdm');
    return file;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
