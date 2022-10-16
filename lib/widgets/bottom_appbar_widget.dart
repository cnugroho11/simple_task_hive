import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_demo/main_controller.dart';

class BottomApbbarWidget extends StatelessWidget {
  const BottomApbbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();

    return BottomAppBar(
      elevation: 100,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => mainController.selectedScreen.value = "Task",
                child: Obx(() => Column(
                  children: [
                    Icon(
                      Icons.task_alt,
                      color: mainController.selectedScreen.value == "Task" 
                        ? Colors.blue
                        : Colors.black26
                    ),
                    Text(
                      'Task',
                      style: TextStyle(
                        color: mainController.selectedScreen.value == "Task"
                          ? Colors.blue
                          : Colors.black26
                      ),
                    )
                  ],
                )),
              ),
              Container(
                width: 55,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => mainController.selectedScreen.value = "Done",
                child: Obx(() => Column(
                  children: [
                    Icon(
                      Icons.history,
                      color: mainController.selectedScreen.value == "Done" 
                        ? Colors.blue
                        : Colors.black26
                    ),
                    Text(
                      'Done',
                      style: TextStyle(
                        color: mainController.selectedScreen.value == "Done"
                          ? Colors.blue
                          : Colors.black26
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}