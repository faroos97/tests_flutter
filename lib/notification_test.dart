/*
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationTest extends StatefulWidget {
  @override
  _NotificationTestState createState() => _NotificationTestState();
}

class _NotificationTestState extends State<NotificationTest> {
  late FlutterLocalNotificationsPlugin localNotifications;

  @override
  void initState() {
    super.initState();
    // Initialiser les notifications
    var androidInitialize = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = const DarwinInitializationSettings(); // Correction ici
    var initializationSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    localNotifications = FlutterLocalNotificationsPlugin();
    localNotifications.initialize(initializationSettings);
  }

  Future<void> showNotification() async {
    var androidDetails = const AndroidNotificationDetails(
      'channelId', // ID unique pour le canal
      'channelName', // Nom du canal
      importance: Importance.high,
      priority: Priority.high,
    );
    var iOSDetails = const DarwinNotificationDetails(); // Correction ici
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);

    await localNotifications.show(
      0, // ID de la notification
      'Rappel d’hydratation 💧',
      'Il est temps de boire un verre d’eau !',
      generalNotificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test de Notification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: showNotification,
          child: const Text('Envoyer une notification'),
        ),
      ),
    );
  }
}
*/
