// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:aplication_colores_page/theme.dart/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

// ignore: use_key_in_widget_constructors
class Page4 extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  List<_SalesData> data = [
    _SalesData('En', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
    _SalesData('Jun', 34),
    _SalesData('Jul', 32),
    _SalesData('Ags', 40),
    _SalesData('Sep', 34),
    _SalesData('Oct', 32),
    _SalesData('Nov', 40),
    _SalesData('Dic', 40),
  ];
  @override
  Widget build(BuildContext context) {
    final themeApp = Provider.of<ThemeChanger>(context);
    final accentColor = themeApp.currenttheme?.accentColor;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Estadistic'),
          backgroundColor: accentColor,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  color: Colors.black.withOpacity(.4),
                  blurRadius: 5,
                )
              ]),
              child: SfCartesianChart(
                  backgroundColor: Colors.white,
                  primaryXAxis: CategoryAxis(),
                  borderColor: Colors.yellow,
                  plotAreaBorderColor: Colors.black12,
                  plotAreaBorderWidth: 5,
                  enableAxisAnimation: true,
                  // isTransposed: true,//Invierte el grafico
                  plotAreaBackgroundColor: Colors.white,
                  // plotAreaBackgroundImage: const NetworkImage('https://i.pinimg.com/564x/a8/2f/15/a82f15a713dfce6a3402332d953e3b9b.jpg'),
                  title: ChartTitle(text: 'Analisis de Datos'),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: TooltipBehavior(
                    color: Colors.indigo,
                    enable: true,
                  ),
                  series: <ChartSeries<_SalesData, String>>[
                    //LineSeries
                    // ColumnSeries
                    //BarSeries
                    //BubbleSeries
                    LineSeries<_SalesData, String>(
                        // width: 2,
                        dataSource: data,
                        // emptyPointSettings: EmptyPointSettings(
                        //     mode: EmptyPointMode.average, color: Colors.orange),
                        markerSettings: MarkerSettings(
                          isVisible: true,
                          borderColor: accentColor,
                          // image: const NetworkImage(
                          //     'https://i.pinimg.com/564x/82/f2/f0/82f2f06cfa1aaaaaa425046ffa228571.jpg')
                        ),
                        xValueMapper: (_SalesData data, _) => data.year,
                        yValueMapper: (_SalesData data, _) => data.sales,
                        color: accentColor,
                        name: 'ventas',

                        // Enable data label
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                        )),

                    ColumnSeries<_SalesData, String>(
                        dataSource: data,
                        xValueMapper: (_SalesData data, _) => data.year,
                        yValueMapper: (_SalesData data, _) => data.sales,
                        name: 'ventas',
                        markerSettings: MarkerSettings(
                          isVisible: true,
                          borderColor: accentColor,
                        ),
                        color: accentColor),
                  ]),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
              //Initialize the spark charts widget
              child: SfSparkLineChart.custom(
                //Enable the trackball
                trackball: const SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                //Enable marker
                marker: const SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 5,
              ),
            ),
          ]),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
