import 'package:durma_sales_app/core/model/order_model.dart';
import 'package:durma_sales_app/view/orders/order_data_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UpdateOrder extends StatefulWidget {
  final OrderModel orderModel;
  const UpdateOrder({super.key, required this.orderModel});

  @override
  State<UpdateOrder> createState() => _UpdateOrderState();
}

class _UpdateOrderState extends State<UpdateOrder> {
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
            "Sipariş Düzenle",
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
                  TextFormField(
                    controller: _stockCodeController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Stok Kodu',
                      hintText: "Stok kodu giriniz",
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    controller: _stockNameController,
                    decoration: const InputDecoration(
                      labelText: 'Stok Adı',
                      hintText: "Stok adı giriniz",
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    controller: _customerController,
                    decoration: const InputDecoration(
                      labelText: 'Cari',
                      hintText: "Cari adı giriniz",
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        labelText: 'Miktar', hintText: "Miktar giriniz"),
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        labelText: 'Fiyat', hintText: "Fiyat giriniz"),
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 20),
                  if (errorText != "") ...[
                    Text(
                      errorText,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    )
                  ],
                  ElevatedButton(
                    onPressed: () => updateOrderButtonTapped(
                        orderDataViewModel: orderDataViewModel),
                    child: const Text('Sipariş Düzenle'),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void updateOrderButtonTapped(
      {required OrderDataViewModel orderDataViewModel}) {
    if (_customerController.text != "" &&
        _priceController.text != "" &&
        _quantityController.text != "" &&
        _stockCodeController.text != "" &&
        _stockNameController.text != "") {
      errorText = "";

      final OrderModel newOrder = OrderModel(
        stockName: _stockNameController.text,
        price: int.tryParse(_priceController.text) ?? 0,
        quantity: int.tryParse(_quantityController.text) ?? 0,
        customerName: _customerController.text,
        stockNo: int.tryParse(_stockCodeController.text) ?? 0,
        date: DateTime.now(),
      );

      orderDataViewModel
          .updateOrder(orderID: widget.orderModel.key, newOrder: newOrder)
          .then((_) {
        showUpdatedMessage();
        context.pop();
      });
    } else {
      errorText = "Lütfen tüm alanları doldurunuz";
    }
    setState(() {});
  }

  showUpdatedMessage() {
    const snackBar = SnackBar(
      content: Text("Sipariş başarıyla güncellendi.",
          style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.green,
      duration: Duration(milliseconds: 1400),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
