import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/models/bike.dart';

class BikeGridItem extends StatelessWidget {

  final Bike bike;
  BikeGridItem(this.bike);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child:
      Image.network(
        bike.imagem,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(bike.modelo),
        subtitle: Text(bike.marca),
        trailing: Text('${bike.jogo}'),

      ),
    );
  }
}
