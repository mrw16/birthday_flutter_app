import 'package:birthday_app/firebase_options.dart';
import 'package:birthday_app/pages/input_name_page.dart';
import 'package:birthday_app/pages/introduction_screen_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getToken();
  initializePlatformNotifications();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  runApp(const MyApp());
}

Future<void> initializePlatformNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const iosInitializationSetting = DarwinInitializationSettings();
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: iosInitializationSetting,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Parse the notification data
  final notification = message.notification!;

  final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    message.messageId!,
    notification.title!,
    channelDescription: notification.body!,
    importance: Importance.max,
    priority: Priority.high,
    icon: '@mipmap/ic_launcher',
  );

  final details =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidDetails,
  );

  // Display the notification
  await flutterLocalNotificationsPlugin.show(
    notification.hashCode,
    notification.title,
    notification.body,
    platformChannelSpecifics,
    payload: message.data['data'],
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

final _router = GoRouter(
  initialLocation: '/introduction-screen',
  routes: [
    GoRoute(
      path: '/introduction-screen',
      builder: (context, state) => const IntroductionScreenPage(),
    ),
    GoRoute(
      path: '/input-name',
      builder: (context, state) => const InputNamePage(),
    ),
  ],
  // errorBuilder: (context, state) => Scaffold(
  //   backgroundColor: Colors.white,
  //   body: Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Image.asset('assets/images/404-not-found.png'),
  //       Text(
  //         'Halaman tidak ditemukan',
  //         style: GoogleFonts.poppins(
  //           fontSize: 14,
  //         ),
  //       ),
  //     ],
  //   ),
  // ),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FirebaseMessaging messaging;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      scrollBehavior: MyBehavior(),
      routerConfig: _router,
    );
  }
}
