import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/components/bike_grid_item.dart';
import 'package:flutter_app_aluguelbikes/mocks/mock_object_bikes.dart';
import 'package:flutter_app_aluguelbikes/models/bike.dart';
import 'package:flutter_app_aluguelbikes/provider/cart_item.dart';
import 'package:flutter_app_aluguelbikes/routes.dart';
import 'package:provider/provider.dart';

class BikesOverviewScreen extends StatefulWidget {

  @override
  _BikesOverviewScreenState createState() => _BikesOverviewScreenState();
}

class _BikesOverviewScreenState extends State<BikesOverviewScreen> {
  final List<Bike> bikes = MOCK_BIKES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Aluguel de Bikes'),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
              icon: Icon(Icons.pedal_bike),
              onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.CART_DETAIL);
              },
          ),
          Consumer<CartItem>(
              builder: (context, cartItem, _) => Text(cartItem.total.toString()),
          ),
          SizedBox(
            width: 18,
          )
        ],
      ),
      body: GridView.builder(
          itemCount: bikes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
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
