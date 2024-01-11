import 'package:durma_sales_app/model/orders.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class OrderData extends ChangeNotifier {
  static const String _boxname = "ordersBox";

  List<Orders> _orders = [];

  void getOrders() async {
    var box = await Hive.openBox<Orders>(OrderData._boxname);

    _orders = box.values.toList();
    notifyListeners();
  }
}
