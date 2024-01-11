import 'package:durma_sales_app/core/model/order_model.dart';
import 'package:durma_sales_app/view/home.dart';
import 'package:durma_sales_app/view/order_list.dart';
import 'package:durma_sales_app/view/orders/add_order.dart';
import 'package:durma_sales_app/view/orders/order_detail.dart';
import 'package:durma_sales_app/view/orders/update_order.dart';
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
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'orderlist',
          builder: (BuildContext context, GoRouterState state) {
            return const OrderList();
          },
        ),
        GoRoute(
            path: 'addorder',
            builder: (BuildContext context, GoRouterState state) {
              return AddOrder();
            }),
        GoRoute(
            path: 'updateOrder',
            name: "updateOrder",
            builder: (BuildContext context, GoRouterState state) {
              return UpdateOrder(orderModel: state.extra as OrderModel);
            }),
        GoRoute(
            path: 'orderDetail',
            name: "orderDetail",
            builder: (BuildContext context, GoRouterState state) {
              return OrderDetail(orderModel: state.extra as OrderModel);
            }),
      ],
    ),
  ],
);
