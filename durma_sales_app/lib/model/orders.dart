import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Orders {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int stockNo;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final String stockName;
  @HiveField(4)
  final String customerName;
  @HiveField(5)
  final DateTime date;
  Orders(
      {required this.id,
      required this.stockName,
      required this.price,
      required this.customerName,
      required this.stockNo,
      required this.date});
}
