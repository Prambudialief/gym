import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gym/pages/home.dart'; // Gantilah dengan halaman utama aplikasi kamu

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () { // Splash muncul selama 3 detik
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => homePage()), // Menuju HomePage
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Warna latar belakang splash
      body: Center(
        child: Image.asset('assets/gym.jpg', width: 200), // Gambar logo
      ),
    );
  }
}
