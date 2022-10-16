import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_demo/main_controller.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: mainController.textTitle,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: mainController.textDescription,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      mainController.insertData();
                      Get.back();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor
                        .resolveWith(
                          (states) => Colors.red
                        )
                      ),
                    child: const Text(
                      'Add Data',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}