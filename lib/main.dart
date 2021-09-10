import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/provider/cart_item.dart';
import 'package:flutter_app_aluguelbikes/provider/cart_provider.dart';
import 'package:flutter_app_aluguelbikes/routes.dart';
import 'package:flutter_app_aluguelbikes/screens/bike_detail_screen.dart';
import 'package:flutter_app_aluguelbikes/screens/bikes_overview_screen.dart';
import 'package:flutter_app_aluguelbikes/screens/cart_detail_screen.dart';
import 'package:provider/provider.dart';
//import 'package:get/get.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: ChangeNotifierProvider(
        create: (context) => CartItem(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BikesOverviewScreen(),
          routes: {
            AppRoutes.BIKE_DETAIL: (context) => BikeDetailScreen(),
            AppRoutes.CART_DETAIL: (context) => CartDetailScreen(),
          },
        ),
      ),
    );
  }
}
