import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:my_lover/presentation/route_list.dart';

import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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

class MainController extends GetxController {
  RxInt selectIndex = 0.obs;

  void onSelectedItem(int index) {
    selectIndex.value = index;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    log('timeZoneName: $timeZoneName');
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
        print('notification payload: $payload');
      }
      selectedNotificationPayload = payload;
      selectNotificationSubject.add(payload);
    });
  }

  Future<void> _scheduleDailyNotification(int id, scheduleTime, {String? message}) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        'My Sumi',
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

  @override
  Future<void> onInit() async {
    super.onInit();
    await _setupLocalNotification();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await flutterLocalNotificationsPlugin.cancelAll();
    // _scheduleDailyNotification(
    //   message: 'Anh yêu em',
    //   scheduleTime: _nextInstanceOfTenAM(22, 0),
    // );
    // _scheduleDailyNotification(
    //   message: 'Sumi ngủ ngoan',
    //   scheduleTime: _nextInstanceOfTenAM(23, 0),
    // );
    // _scheduleDailyNotification(
    //   message: 'Sumi ơi! Dậy đi làm thôi. 6h30 rồi',
    //   scheduleTime: _nextInstanceOfTenAM(6, 30),
    // );
    _scheduleDailyNotification(
      0,
      _nextInstanceOfTenAM(10, 24),
      message: 'Anh yêu em',
    );
    _scheduleDailyNotification(
      1,
      _nextInstanceOfTenAM(23, 00),
      message: 'Sumi ngủ ngoan',
    );
    _scheduleDailyNotification(
      2,
      _nextInstanceOfTenAM(6, 30),
      message: 'Sumi ơi! Dậy đi làm thôi. 6h30 rồi',
    );
  }
}
