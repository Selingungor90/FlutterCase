import 'package:durma_sales_app/core/routes/router.dart';
import 'package:durma_sales_app/core/services/hive_service.dart';
import 'package:durma_sales_app/view/orders/order_data_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  HiveService.instance.initHiveService();
  runApp(const DurmaSalesApp());
}

class DurmaSalesApp extends StatelessWidget {
  const DurmaSalesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrderDataViewModel())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Durma Sales App",
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 5,
            color: Colors.red,
            iconTheme: const IconThemeData(color: Colors.white),
            toolbarTextStyle: const TextTheme(
              headline6: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ).bodyMedium,
            titleTextStyle: const TextTheme(
              headline6: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ).titleLarge,
          ),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 1, 1)),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
