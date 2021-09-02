import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/routes.dart';
import 'package:flutter_app_aluguelbikes/screens/bike_detail_screen.dart';
import 'package:flutter_app_aluguelbikes/screens/bikes_overview_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BikesOverviewScreen(),
      routes: {
        AppRoutes.BIKE_DETAIL: (context) => BikeDetailScreen(),
      },
    );
  }
}


