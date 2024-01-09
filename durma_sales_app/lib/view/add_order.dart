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
        title: const Text("Durma Sales App",style: TextStyle(color:Colors.white),),
        backgroundColor: Colors.red
      ),
      body: const Center(
   
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                



          ],
        ),
      ),
    );
  }
}
