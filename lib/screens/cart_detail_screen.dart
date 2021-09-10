import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/models/bike.dart';
import 'package:flutter_app_aluguelbikes/provider/cart_item.dart';
import 'package:flutter_app_aluguelbikes/provider/cart_provider.dart';
import 'package:flutter_app_aluguelbikes/routes.dart';
import 'package:flutter_app_aluguelbikes/screens/snackbar_screen.dart';
import 'package:provider/provider.dart';

class CartDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final List<Bike> bikes = Provider.of<CartItem>(context).bikes;
    var cartProvider = Provider.of<CartItem>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Registro de Aluguel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemCount: bikes.length,
                separatorBuilder: (context, int index) => const Divider(color: Colors.black26),
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      title: Text('${index+1} - ${bikes[index].modelo} - R\$ ${bikes[index].valor}'.toUpperCase(),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      trailing: GestureDetector(
                        onTap: (){
                          cartProvider.removeBikes(bikes[index]);
                          ScaffoldMessenger.of(context).showSnackBar(snackBarR);
                        },
                          child: Icon(Icons.remove_shopping_cart_rounded)),
                    ),
                  );
                },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.payment), label: Text('Ir para o Pagamento'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)) ,),
            )
          ],
        ),
      ),
    );
  }
}
