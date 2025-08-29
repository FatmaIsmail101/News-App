import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/core/constants/assets.dart';
import 'package:news/core/routes/page_route_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        PageRoutesName.home,
        (routes) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 170),
          Expanded(
            child: Center(
              child: Image.asset(AppAssets.splash, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
