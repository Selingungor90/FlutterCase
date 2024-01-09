import 'package:durma_sales_app/view/add_order.dart';
import 'package:durma_sales_app/view/home.dart';
import 'package:durma_sales_app/view/order_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
/* final GoRouter router = GoRouter(routes: 
[
  GoRoute(path: "/",name:"home",builder:(context,state)=> HomePage(),
  ),
  GoRoute(
path: "order",name:"order",builder: (context, state) => OrderList(),
  )
]
); */
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return  HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'orderlist',
          builder: (BuildContext context, GoRouterState state) {
            return  OrderList();
          },
        ),
        GoRoute(path: 'addorder',builder: (BuildContext context,GoRouterState state) {
          return AddOrder();
        })
      ],
    
    ),
  ],
);