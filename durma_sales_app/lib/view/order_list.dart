import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  @override
  State<OrderList> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Durma Sales App",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/durma.png',
              width: 200,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
