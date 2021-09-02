import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/models/bike.dart';
import 'package:flutter_app_aluguelbikes/routes.dart';

class BikeGridItem extends StatelessWidget {
  final Bike bike;
  BikeGridItem(this.bike);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.BIKE_DETAIL,
            arguments: bike,
          );
        },
        child: Image(
          image: CachedNetworkImageProvider(bike.imagem),
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(bike.modelo),
        subtitle: Text(bike.marca),
        trailing: Text(
          'R\$ ${bike.valor}',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
