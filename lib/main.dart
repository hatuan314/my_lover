import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_lover/presentation/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, // Color for Android
      statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
  ));
  // await Firebase.initializeApp();
  runApp(const MyApp());
}
