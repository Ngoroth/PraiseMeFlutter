import 'package:flutter/material.dart';
import 'package:praise_me/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import './praises.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isNotificationsActive = false;
  String? lastPraise;

  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(lastPraise ?? ''),
            isNotificationsActive
                ? ElevatedButton(
                    onPressed: () {
                      NotificationService().cancellNotifications();
                      setState(() {
                        isNotificationsActive = false;
                      });
                    },
                    child: const Text("Cancel notifications"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                  )
                : ElevatedButton(
                    onPressed: () {
                      lastPraise = getRandomPraise();
                      NotificationService().showNotificationPeriodically(
                          1, widget.title, lastPraise!);
                      setState(() {
                        isNotificationsActive = true;
                      });
                    },
                    child: const Text("Show notification"),
                  ),
          ],
        ),
      ),
    );
  }
}
