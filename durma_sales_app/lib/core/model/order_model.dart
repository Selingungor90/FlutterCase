import 'package:hive/hive.dart';
part 'order_model.g.dart';

@HiveType(typeId: 4)
class OrderModel extends HiveObject {
  @HiveField(0)
  final int stockNo;
  @HiveField(1)
  final int quantity;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final String stockName;
  @HiveField(4)
  final String customerName;
  @HiveField(5)
  final DateTime date;

  OrderModel(
      {required this.stockName,
      required this.quantity,
      required this.price,
      required this.customerName,
      required this.stockNo,
      required this.date});
}
