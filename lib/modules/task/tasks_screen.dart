import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_demo/main_controller.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'On Going Task',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mainController.tasksOngoing.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) => mainController.markAsDone(index),
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          color: Colors.green,
                          child: const Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerRight,
                          color: Colors.green,
                          child: const Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mainController.tasksOngoing[index].title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(mainController.tasksOngoing[index].description),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(mainController.tasksOngoing[index].date.toString()),
                            Text(mainController.tasksOngoing[index].time.toString())
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}