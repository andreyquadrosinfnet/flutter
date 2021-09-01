import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/components/bike_grid_item.dart';
import 'package:flutter_app_aluguelbikes/mocks/mock_object_bikes.dart';
import 'package:flutter_app_aluguelbikes/models/bike.dart';

class BikesOverviewScreen extends StatelessWidget {

  final List<Bike> bikes = MOCK_BIKES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alguel de Bikes'),
        backgroundColor: Colors.transparent,
      ),
      body: GridView.builder(
          itemCount: bikes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            return BikeGridItem(bikes[index]);
          }),
    );
  }
}
