import 'package:hive/hive.dart';

part 'card_model.g.dart';

@HiveType(typeId: 0)
class CardModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final bool isComplete;

  @HiveField(3)
  final String date;

  @HiveField(4)
  final String time;

  CardModel({
    required this.title,
    required this.description,
    required this.isComplete,
    required this.date,
    required this.time,
  });
}