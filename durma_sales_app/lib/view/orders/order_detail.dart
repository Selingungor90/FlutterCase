import 'package:durma_sales_app/core/model/order_model.dart';
import 'package:durma_sales_app/view/orders/order_data_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OrderDetail extends StatefulWidget {
  final OrderModel orderModel;
  const OrderDetail({super.key, required this.orderModel});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final TextEditingController _stockCodeController = TextEditingController();
  final TextEditingController _stockNameController = TextEditingController();
  final TextEditingController _customerController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String errorText = "";

  @override
  void dispose() {
    super.dispose();
    _stockCodeController.dispose();
    _stockNameController.dispose();
    _customerController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _stockCodeController.text = widget.orderModel.stockNo.toString();
    _stockNameController.text = widget.orderModel.stockName;
    _customerController.text = widget.orderModel.customerName;
    _quantityController.text = widget.orderModel.quantity.toString();
    _priceController.text = widget.orderModel.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    final OrderDataViewModel orderDataViewModel =
        Provider.of<OrderDataViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Sipariş Bilgileri",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
              width: 370,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () => updateOrderButtonTapped(),
                        child: const Text(
                          "Siparişi Düzenle",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            deleteOrderButtonTapped(orderDataViewModel),
                        child: const Text(
                          "Siparişi Sil",
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    controller: _stockCodeController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Stok Kodu',
                    ),
                    textInputAction: TextInputAction.next,
                    readOnly: true,
                  ),
                  TextFormField(
                    controller: _stockNameController,
                    decoration: const InputDecoration(
                      labelText: 'Stok Adı',
                      border: InputBorder.none,
                    ),
                    textInputAction: TextInputAction.next,
                    readOnly: true,
                  ),
                  TextFormField(
                    controller: _customerController,
                    decoration: const InputDecoration(
                      labelText: 'Cari',
                      border: InputBorder.none,
                    ),
                    textInputAction: TextInputAction.next,
                    readOnly: true,
                  ),
                  TextFormField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: "Miktar",
                      border: InputBorder.none,
                    ),
                    textInputAction: TextInputAction.next,
                    readOnly: true,
                  ),
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        labelText: 'Fiyat', border: InputBorder.none),
                    textInputAction: TextInputAction.done,
                    readOnly: true,
                  ),
                  const SizedBox(height: 20),
                  if (errorText != "") ...[
                    Text(
                      errorText,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    )
                  ],
                ],
              )),
        ),
      ),
    );
  }

  updateOrderButtonTapped() {
    context.goNamed("updateOrder", extra: widget.orderModel);
  }

  deleteOrderButtonTapped(OrderDataViewModel orderDataViewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Uyarı !"),
          content: Text(
              "${widget.orderModel.customerName} isimli siparişi silmek istiyor musunuz ?"),
          actions: [
            TextButton(
              onPressed: () {
                orderDataViewModel
                    .deleteOrder(order: widget.orderModel)
                    .then((_) {
                  showDeletedMessage();
                  while (context.canPop()) {
                    context.pop();
                  }
                });
              },
              child: const Text('Siparişi Sil'),
            ),
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Vazgeç'),
            ),
          ],
        );
      },
    );
  }

  showDeletedMessage() {
    const snackBar = SnackBar(
      content: Text("Sipariş başarıyla silindi.",
          style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
      duration: Duration(milliseconds: 1400),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
