import 'package:flutter/material.dart';
import 'notification_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationTest(),
    );
  }
}
