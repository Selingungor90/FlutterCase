import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {

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
        title: Text("Durma Sales App",style: TextStyle(color:Colors.white),),
        backgroundColor: Colors.red
      ),
      body: Center(
   
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                 Image.asset(
                'assets/images/durma.png',
                width: 200, 
             ),
              SizedBox(height: 50),

              ElevatedButton(
                              onPressed: ()=>context.go('/addorder'),

                child: Text('Sipariş Oluştur',style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(minimumSize: Size(200,50)),
              ),
              
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: ()=>context.go('/orderlist'),
                child: Text('Sipariş Listesi',style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(minimumSize: Size(200,50)),

              ),

          ],
        ),
      ),
    );
  }
}
