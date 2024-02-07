import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pushnotification/main.dart';

class FirebaseApi {
  Future<void> setupInteractedMessage() async {
    final _ = await FirebaseMessaging.instance.requestPermission();
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("FCMToken $fcmToken");

    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      handleBackgroundMessage(message);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(handleBackgroundMessage);
  }

  void handleBackgroundMessage(RemoteMessage message) {
    print("message $message");
    navigatorKey.currentState?.pushNamed('/chat', arguments: message);
  }
}
