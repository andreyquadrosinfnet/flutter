import 'package:flutter/material.dart';

class Bike {
  final int id;
  final String marca;
  final String modelo;
  final int jogo;
  final double valor;
  final String imagem;

  Bike({
    @required this.id,
    @required this.marca,
    @required this.modelo,
    @required this.jogo,
    @required this.valor,
    @required this.imagem,
  });
}