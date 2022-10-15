import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'package:hive_demo/models/card_model.dart';

class HomeScreenController extends GetxController {
  final dateFormatter = DateFormat('dd MMM yyyy');
  final timeFormatter = DateFormat('hh:mm');

  Box? box;
  final String _boxName = 'tasks';

  final RxList _tasks = [].obs;
  List get tasks  => _tasks.toList();

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

  void toggleTasks(int taskIndex) {
    try {
      box!.deleteAt(taskIndex);
      getData();
    } catch (e) {
      print('error => $e');
    }
  }

  void getData() {
    try{
      _tasks.value = box!.values.toList();
    } catch(e) {
      print('error => $e');
    }
  }
}