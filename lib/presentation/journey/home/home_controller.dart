import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:my_lover/presentation/journey/home/widgets/happy_birthday_sumi_dialog.dart';
import 'package:my_lover/presentation/route_list.dart';
import 'package:my_lover/presentation/widgets/app_dialog.dart';

import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'widgets/one_year_anniversary_lovers_dialog.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String?> selectNotificationSubject = BehaviorSubject<String?>();

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

String? selectedNotificationPayload;

class HomeController extends GetxController {
  RxInt myAge = 0.obs;
  RxInt sumiAge = 0.obs;
  RxInt dating = 0.obs;

  static const int dayMillisecond = 24 * 60 * 60 * 1000;
  late BuildContext context;

  int _setAge(int yearOfBirth) {
    return DateTime.now().year - yearOfBirth;
  }

  void _setCoupeAge() {
    myAge.value = _setAge(1997);
    sumiAge.value = _setAge(1998);
  }

  void _setDating() {
    int startDating = DateTime(2021, 10, 24).millisecondsSinceEpoch;
    int now = DateTime.now().millisecondsSinceEpoch;
    int currentDatingMilliseconds = now - startDating;
    dating.value = (currentDatingMilliseconds / dayMillisecond).floor();
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

  Future<void> _setupLocalNotification() async {
    await _configureLocalTimeZone();

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    String initialRoute = RouteList.mainScreen;
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload = notificationAppLaunchDetails!.payload;
      // initialRoute = SecondPage.routeName;
    }

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: (
          int id,
          String? title,
          String? body,
          String? payload,
        ) async {
          didReceiveLocalNotificationSubject.add(
            ReceivedNotification(
              id: id,
              title: title,
              body: body,
              payload: payload,
            ),
          );
        });
    final InitializationSettings initializationSettings = InitializationSettings(
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        log('payload: $payload');
      }
      selectedNotificationPayload = payload;
      selectNotificationSubject.add(payload);
    });
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(3, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'HAPPY_BIRTHDAY');
  }

  Future<void> _scheduleNotification(int id, scheduleTime, {String? title, String? message}) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title ?? 'My Sumi',
        message ?? 'Anh yêu em',
        scheduleTime,
        const NotificationDetails(
          android: AndroidNotificationDetails('daily notification channel id', 'daily notification channel name',
              channelDescription: 'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextInstanceOfTenAM(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    log('scheduledDate.isBefore(now): ${scheduledDate.isBefore(now)}');
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  tz.TZDateTime _nextInstanceOfSpecialDay(DateTime date) {
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, date.year, date.month, date.day, date.hour, date.minute);
    return scheduledDate;
  }

  Future<void> _onCreateSchedule() async {
    await flutterLocalNotificationsPlugin.cancelAll();
    _scheduleNotification(
      0,
      _nextInstanceOfTenAM(10, 24),
      message: 'Anh yêu em❤️',
    );
    _scheduleNotification(
      1,
      _nextInstanceOfTenAM(23, 00),
      message: 'Sumi ngủ ngoan😴',
    );
    _scheduleNotification(
      2,
      _nextInstanceOfTenAM(6, 30),
      message: 'Sumi ơi! Dậy đi làm thôi. 6h30 rồi',
    );
    _scheduleNotification(
      3,
      _nextInstanceOfSpecialDay(DateTime(2022, 7, 13, 7)),
      title: '️Chúc mừng sinh nhật Sumi️️🎉',
      message: 'Sumi ơi! Hãy mở app My Sumi để xem lời chúc của anh nhé❤️',
    );
    _scheduleNotification(
      4,
      _nextInstanceOfSpecialDay(DateTime(2022, 10, 24, 7)),
      title: 'Kỷ niệm 1 năm ngày yêu💖',
      message: 'Sumi ơi! Hãy mở app My Sumi để xem lời nhắn của anh nhé❤️',
    );
  }

  Future<void> _showDialog() async {
    var now = DateTime.now();
    var currentDate = DateTime(now.year, now.month, now.day);
    await Future.delayed(const Duration(seconds: 1));
    if (currentDate == DateTime(2022, 7, 13)) {
      showAppDialog(context,
          child: HappyBirthdaySumiDialog(
            dating: dating.value,
          ));
    } else if (currentDate == DateTime(2022, 10, 24)) {
      showAppDialog(context, child: const OneYearAnniversaryLoversDialog());
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await _setupLocalNotification();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    _setCoupeAge();
    _setDating();
    _showDialog();
    _onCreateSchedule();
  }
}
