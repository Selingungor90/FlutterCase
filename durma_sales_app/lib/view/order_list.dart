import 'package:durma_sales_app/core/model/order_model.dart';
import 'package:durma_sales_app/view/order_tile.dart';
import 'package:durma_sales_app/view/orders/order_data_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrderList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrderDataViewModel orderDataViewModel =
        Provider.of<OrderDataViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Sipariş Listesi",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: orderDataViewModel.orderList.length,
              padding: const EdgeInsets.fromLTRB(0.0, 6.0, 8.0, 4.0),
              itemBuilder: (context, index) {
                if (orderDataViewModel.orderList.isNotEmpty) {
                  List<OrderModel> orderList = orderDataViewModel.orderList;

                  return OrderTile(orderModel: orderList[index]);
                } else {
                  return const Text("Listede sipariş bulunamadı");
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
