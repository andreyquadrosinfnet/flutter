import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/models/bike.dart';

class BikeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bike bike = ModalRoute.of(context).settings.arguments as Bike;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(bike.modelo),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(image: CachedNetworkImageProvider(bike.imagem),fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text('Marca: ${bike.marca} Modelo: ${bike.modelo} Nota do Jogo: ${bike.jogo} Valor da diária: R\$ ${bike.valor}',
                            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 10, 32, 0),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text:  '${bike.descricao}',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
