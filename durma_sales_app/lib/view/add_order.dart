import 'package:flutter/material.dart';

class AddOrder extends StatefulWidget {
  @override
  State<AddOrder> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Durma Sales App",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 370,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: OrderForm(),
          ),
        ),
      ),
    );
  }
}

class OrderForm extends StatefulWidget {
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final TextEditingController stockCodeController = TextEditingController();
  final TextEditingController stockNameController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: stockCodeController,
          decoration: InputDecoration(labelText: 'Stok Kodu'),
        ),
        TextFormField(
          controller: stockNameController,
          decoration: InputDecoration(labelText: 'Stok Adı'),
        ),
        TextFormField(
          controller: customerController,
          decoration: InputDecoration(labelText: 'Cari'),
        ),
        TextFormField(
          controller: quantityController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Miktar'),
        ),
        TextFormField(
          controller: priceController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Fiyat'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            print('Sipariş Oluşturuldu!');
          },
          child: Text('Sipariş Oluştur'),
        ),
      ],
    );
  }
}
