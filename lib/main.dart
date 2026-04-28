import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_provider/screens/splash_screen.dart';

import 'provider/task_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(), 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen (), 
      ),
    );
  }
}