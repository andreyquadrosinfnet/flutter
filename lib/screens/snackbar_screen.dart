import 'package:flutter/material.dart';

    final snackBarE = SnackBar(
      margin: EdgeInsets.only(top: 300) ,
      content: Text('Já consta no registro!', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
      backgroundColor: Colors.deepOrange,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    );

    final snackBarS = SnackBar(
      margin: EdgeInsets.only(top: 300) ,
      content: Text('Inserido no registro com sucesso!', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    );

    final snackBarR = SnackBar(
      margin: EdgeInsets.only(top: 300) ,
      content: Text('Removido com sucesso!', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
      backgroundColor: Colors.lightBlueAccent,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    );


