import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/home_page.dart';

import 'auth/google_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        User? userId = FirebaseAuth.instance.currentUser;
        if (userId == null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AuthView()));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.burgundy,
      body: Center(child: Image.asset('assets/flashNews.jpg')),
    );
  }
}
