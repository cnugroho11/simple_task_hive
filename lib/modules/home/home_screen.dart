import 'package:flutter/material.dart';
import 'package:hive_demo/main_controller.dart';
import 'package:get/get.dart';

import 'package:hive_demo/widgets/bottom_appbar_widget.dart';
import 'package:hive_demo/widgets/floating_action_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Your Tasks'),
      ),
      body: Obx(() => mainController.taskScreen()),
      bottomNavigationBar: const BottomApbbarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButtonWidget(),
    );
  }
}
