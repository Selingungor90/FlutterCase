import 'package:durma_sales_app/core/model/order_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveService {
  static HiveService? _instance;

  HiveService._();
  late Box _ordersBox;

  static HiveService get instance {
    _instance ??= HiveService._();
    return _instance!;
  }

  Future<void> initHiveService() async {
    await Hive.initFlutter();
    Hive.registerAdapter(OrderModelAdapter());
    _ordersBox = await Hive.openBox<OrderModel>("ordersBox");
  }

  List<OrderModel> getOrdersList() {
    return _ordersBox.values.cast<OrderModel>().toList();
  }

  OrderModel getOrderModel({required int orderId}) {
    return _ordersBox.get(orderId);
  }

  Future<void> addOrderModel({required OrderModel model}) async {
    await _ordersBox.add(model);
  }

  Future<void> updateOrderModel(
      {required int orderID, required OrderModel newModel}) async {
    await _ordersBox.putAt(orderID, newModel);
  }

  Future<void> deleteOrder({required int key}) async {
    await _ordersBox.deleteAt(key);
  }

  Future<void> closeHive() async {
    await Hive.close();
  }
}
