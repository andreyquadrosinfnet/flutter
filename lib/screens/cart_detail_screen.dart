import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/models/bike.dart';
import 'package:flutter_app_aluguelbikes/provider/cart_item.dart';
import 'package:flutter_app_aluguelbikes/provider/cart_provider.dart';
import 'package:flutter_app_aluguelbikes/routes.dart';
import 'package:flutter_app_aluguelbikes/screens/snackbar_screen.dart';
import 'package:flutter_app_aluguelbikes/services/get_preferenceId.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'package:provider/provider.dart';

const publicKey = "TEST-95954422-7b41-4f52-92b3-09d0d09fd4e7";
var preferenceId = "66513246-8138e083-47b8-4294-b078-54fe21e48bd9";

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
                          cartProvider.mPrice(bikes[index]);
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
                  onPressed: () async{
                    preferenceId = await getPreferenceId(
                      title: 'Aluguel de Bike',
                      description: 'Você está alugando Bikes no nosso App',
                      quantity: 1,
                      currency_id: 'BRL',
                      unit_price: cartProvider.somaTotal,
                      email: 'andrey.quadros@ifro.edu.br'
                    );

                    PaymentResult result =
                        await MercadoPagoMobileCheckout.startCheckout(
                      publicKey,
                      preferenceId,
                    );
                  },
                  icon: Icon(Icons.payment), label: Text('Alugar ${cartProvider.total} Bikes por R\$ ${cartProvider.somaTotal.toStringAsFixed(2)}'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)) ,),
            )
          ],
        ),
      ),
    );
  }
}
