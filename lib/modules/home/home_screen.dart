import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_demo/modules/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Tasks'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                  itemCount: homeScreenController.tasks.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) => homeScreenController.toggleTasks(index),
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
                                  homeScreenController.tasks[index].title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(homeScreenController.tasks[index].description),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(homeScreenController.tasks[index].date.toString()),
                                Text(homeScreenController.tasks[index].time.toString())
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
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
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
                      controller: homeScreenController.textTitle,
                      decoration: const InputDecoration(hintText: 'Title'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: homeScreenController.textDescription,
                      decoration: const InputDecoration(hintText: 'Description'),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        homeScreenController.insertData();
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
      ),
    );
  }
}
