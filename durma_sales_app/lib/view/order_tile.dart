import 'package:durma_sales_app/core/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderTile extends StatelessWidget {
  final OrderModel orderModel;

  const OrderTile({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: orderModel.key % 2 == 0
              ? Color.fromARGB(255, 230, 230, 230)
              : Colors.white),
      child: ListTile(
          title: Text(
            "Sipariş No - ${orderModel.key.toString()} / Cari Adı: ${orderModel.customerName}",
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
          ),
          subtitle: Text(
            "Ürün -  ${orderModel.stockName.toString()}",
            style: const TextStyle(
                color: Color.fromARGB(255, 71, 71, 71),
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
          onTap: () => navigateToOrderDetail(context)),
    );
  }

  void navigateToOrderDetail(BuildContext context) {
    context.goNamed("orderDetail", extra: orderModel);
  }
}
