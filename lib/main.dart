import 'package:flutter/material.dart';
import 'package:praise_me/main_screen.dart';
import 'package:praise_me/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MainScreen(
        title: 'PriseMe',
      ),
    );
  }
}
