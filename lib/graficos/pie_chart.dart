// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//https://www.syncfusion.com/flutter-widgets/flutter-charts/chart-types/error-bar-chart
class PieChartGrafica extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  PieChartGrafica({Key? key}) : super(key: key);

  @override
  _PieChartGraficaState createState() => _PieChartGraficaState();
}

class _PieChartGraficaState extends State<PieChartGrafica> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
 
  @override
  void initState() {
    data = [
      _ChartData('David', 25),
      _ChartData('Steve', 38),
      _ChartData('Jack', 34),
      _ChartData('Others', 52)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SfCircularChart(
                  tooltipBehavior: _tooltip,
                  series: <CircularSeries<_ChartData, String>>[
                    DoughnutSeries<_ChartData, String>(
                        explodeAll: false,
                        pointRenderMode: PointRenderMode.segment,
                        // strokeWidth: 2,
                        // strokeColor: Colors.black12,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                        ),
                        opacity: .85,
                        selectionBehavior: SelectionBehavior(
                          enable: true,
                        ),
                        legendIconType: LegendIconType.horizontalLine,
                        cornerStyle: CornerStyle.bothFlat,
                        explode: true,
                        dataSource: data,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: 'Gold'),
                  ]),
              SfCircularChart(
                  tooltipBehavior: _tooltip,
                  series: <CircularSeries<_ChartData, String>>[
                    RadialBarSeries<_ChartData, String>(
                        dataSource: data,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y)
                  ]),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SfPyramidChart(
                        series: PyramidSeries<_ChartData, String>(
                            dataSource: data,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y)),
                    SfFunnelChart(
                        series: FunnelSeries<_ChartData, String>(
                            dataSource: data,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y)),
                  ],
                ),
              ),
              SfCartesianChart(series: <ChartSeries>[
                HistogramSeries<_ChartData, num>(
                    dataSource: data,
                    yValueMapper: (_ChartData sales, _) => sales.y,
                    binInterval: 20,
                    showNormalDistributionCurve: true,
                    curveColor: const Color.fromRGBO(192, 108, 132, 1),
                    borderWidth: 3),
              ]),
            ],
          ),
        ));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
