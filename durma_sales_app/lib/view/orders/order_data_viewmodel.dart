import 'package:durma_sales_app/core/model/order_model.dart';
import 'package:durma_sales_app/core/services/hive_service.dart';
import 'package:flutter/material.dart';

class OrderDataViewModel extends ChangeNotifier {
  List<OrderModel> _ordersList = [];
  List<OrderModel> get orderList => _ordersList;

  OrderDataViewModel() {
    getOrderList();
  }

  getOrderList() async {
    _ordersList = HiveService.instance.getOrdersList();
    notifyListeners();
  }

  Future<OrderModel> getOrderModel({required int id}) async {
    return HiveService.instance.getOrderModel(orderId: id);
  }

  Future<void> addOrder({required OrderModel order}) async {
    await HiveService.instance.addOrderModel(model: order);
    getOrderList();
  }

  Future<void> updateOrder(
      {required orderID, required OrderModel newOrder}) async {
    await HiveService.instance
        .updateOrderModel(orderID: orderID, newModel: newOrder);
    getOrderList();
  }

  Future<void> deleteOrder({required OrderModel order}) async {
    await HiveService.instance.deleteOrder(key: order.key);
    getOrderList();
  }
}
