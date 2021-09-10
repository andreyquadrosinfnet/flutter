import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/models/bike.dart';
import 'package:flutter_app_aluguelbikes/provider/cart_item.dart';
import 'package:flutter_app_aluguelbikes/provider/cart_provider.dart';
import 'package:flutter_app_aluguelbikes/routes.dart';
import 'package:flutter_app_aluguelbikes/screens/snackbar_screen.dart';
import 'package:provider/provider.dart';

class BikeGridItem extends StatelessWidget {
  final Bike bike;
  BikeGridItem(this.bike);


  @override
  Widget build(BuildContext context) {

    var cartProvider = Provider.of<CartItem>(context);
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
        leading: GestureDetector(
            child: Icon(
                Icons.add_shopping_cart),
          onTap: (){
              if(cartProvider.bikes.contains(bike)){
                ScaffoldMessenger.of(context).showSnackBar(snackBarE);
              }else{
                ScaffoldMessenger.of(context).showSnackBar(snackBarS);
                cartProvider.addBikes(bike);
                print('${cartProvider.total}');
              }


          },
        ),
      ),
    );
  }
}
