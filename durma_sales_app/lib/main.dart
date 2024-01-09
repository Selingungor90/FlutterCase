import 'package:durma_sales_app/Routes/router.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 5,
          color: Colors.red, // AppBar'ın arka plan rengi
          iconTheme: IconThemeData(color: Colors.white), toolbarTextStyle: TextTheme(
            headline6: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold, 
            ),).bodyText2, titleTextStyle: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            ),).headline6,),
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 1, 1)),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
