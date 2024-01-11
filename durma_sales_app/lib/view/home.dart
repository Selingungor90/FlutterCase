import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 5,
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
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => context.go('/addorder'),
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              child: const Text(
                'Sipariş Oluştur',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/orderlist'),
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              child: const Text(
                'Sipariş Listesi',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
