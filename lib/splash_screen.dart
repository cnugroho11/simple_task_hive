import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_demo/modules/home/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> initService() async {
    await Hive.initFlutter();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => const HomeScreen());
    });
  }

  @override
  void initState() {
    initService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: const Text(
        'Simple Task',
        style: TextStyle(
          fontSize: 30,
          color: Colors.black
        ),
        ),
      ),
    );
  }
}