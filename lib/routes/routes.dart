

import 'package:aplication_colores_page/graficos/pie_chart.dart';
import 'package:aplication_colores_page/graficos/pages.dart';
import 'package:flutter/material.dart';


final pageRoute = <_Routes>[
  _Routes(const Icon(Icons.abc), 'ALide SHow', PieChartGrafica()),
  _Routes(const Icon(Icons.image), 'Image SHow',  PieChartGrafica()),
  _Routes(const Icon(Icons.camera), 'Camera SHow',  Page4()),
  _Routes(const Icon(Icons.pin_outlined), 'Menu SHow',  Page4()),
];

class _Routes {

  final Icon icon;
  final String titulo;
  final Widget page;

  _Routes( this.icon,  this.titulo, this.page);
}