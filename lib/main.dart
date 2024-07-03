import 'package:flutter/material.dart';
import 'package:lesson_69_local_notifications/services/local_notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationsService.requestPermission();
  await LocalNotificationsService.start();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!LocalNotificationsService.notificationEnabled)
                const Text("Siz xabarnomaga ruxsat berdingiz"),
              const Center(
                child: ElevatedButton(
                  onPressed: LocalNotificationsService.showNotification,
                  child: Text("Show notification"),
                ),
              )
            ],
          ),
        ));
  }
}
