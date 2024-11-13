import 'package:appscrip_demo/screen/user_list/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'User List Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(fontSize: 16),
          bodySmall: TextStyle(fontSize: 14),
          headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      home: UserListScreen(),
    );
  }
}