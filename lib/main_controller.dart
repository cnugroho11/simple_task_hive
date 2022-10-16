import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/modules/done/done_screen.dart';
import 'package:hive_demo/modules/task/tasks_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'package:hive_demo/models/card_model.dart';

class MainController extends GetxController {
  final dateFormatter = DateFormat('dd MMM yyyy');
  final timeFormatter = DateFormat('HH:mm');
  RxString selectedScreen = "Task".obs;

  Box? box;
  final String _boxName = 'tasks';
  
  final RxList _tasks = [].obs;
  List get tasks  => _tasks.toList();

  final RxList _tasksOngoing = [].obs;
  List get tasksOngoing  => _tasksOngoing.toList();

  final RxList _tasksDone = [].obs;
  List get tasksDone => _tasksDone.toList();

  TextEditingController textTitle = TextEditingController();
  TextEditingController textDescription = TextEditingController();

  @override
  void onInit() async {
    Hive.registerAdapter(CardModelAdapter());
    box = await Hive.openBox<CardModel>(_boxName);
    getData();
    super.onInit();
  }

  void insertData() async {
    CardModel data = CardModel(
      title: textTitle.text, 
      description: textDescription.text, 
      isComplete: false,
      date: dateFormatter.format(DateTime.now()),
      time: timeFormatter.format(DateTime.now())
    );
    
    try {
      box!.add(data);
      getData();
    } catch(e) {
      print('error => $e');
    } finally {
      textTitle.clear();
      textDescription.clear();
    }
  }

  void markAsDone(int taskIndex) {
    try {
      int idx = _tasks.indexOf(_tasksOngoing[taskIndex]);
      var data = box!.getAt(idx);

      CardModel edited = CardModel(
        title: data.title, 
        description: data.description, 
        isComplete: true,
        date: data.date,
        time: data.time
      );

      box!.putAt(idx, edited);
      getData();
    } catch (e) {
      print('error => $e');
    }
  }

  void deleteData(int taskIndex) {
    try {
      int idx = _tasks.indexOf(_tasksDone[taskIndex]);
      box!.deleteAt(idx);
      
      getData();
    } catch (e) {
      print('error => $e');
    }
  }

  void getData() {
    try {
      _tasks.value = box!.values.toList();
      _tasksOngoing.value = _tasks.where((e) => e.isComplete == false).toList();
      _tasksDone.value = tasks.where((e) => e.isComplete == true).toList();

    } catch(e) {
      print('error => $e');
    }
  }

  Widget taskScreen() {
    switch(selectedScreen.value) {
      case "Task":
        return const TasksScreen();
      case "Done":
        return const DoneScreen();
      default:
        return const TasksScreen();
    }
  }
}