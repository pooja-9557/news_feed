import 'package:flutter/material.dart';
import 'package:news_feed/news_feed.dart';
import 'package:shimmer/shimmer.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NewsFeed(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.brown[400]!,
          highlightColor: Colors.brown[50]!,
          child: const Text(
            'Welcome to News Feed',
            style: TextStyle(
              fontSize: 36.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
