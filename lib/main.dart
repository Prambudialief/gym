import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAOINkf9StuNUVyeT4ZXdsRuvE2uNd6EzI",
      appId: "1:942553012610:android:3b40773dd70f7e2982579b",
      messagingSenderId: "942553012610",
      projectId: "gym-crud-f1c19",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}