// ignore_for_file: unnecessary_new, must_be_immutable, sized_box_for_whitespace

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final dataPlan = [
    OrdinalSales(1, 'Jan', 5),
    OrdinalSales(2, 'Feb', 25),
    OrdinalSales(3, 'Mar', 45),
    OrdinalSales(4, 'Apr', 67),
    OrdinalSales(5, 'May', 30),
    OrdinalSales(6, 'Jun', 60),
    OrdinalSales(7, 'Jul', 120),
    OrdinalSales(8, 'Aug', 80),
    OrdinalSales(9, 'Sep', 78),
    OrdinalSales(10, 'Oct', 90),
    OrdinalSales(11, 'Nov', 100),
    OrdinalSales(12, 'Dec', 150),
  ];

  final dataActual = [
    OrdinalSales(1, 'Jan', 10),
    OrdinalSales(2, 'Feb', 20),
    OrdinalSales(3, 'Mar', 34),
    OrdinalSales(4, 'Apr', 50),
    OrdinalSales(5, 'May', 40),
    OrdinalSales(6, 'Jun', 70),
    OrdinalSales(7, 'Jul', 100),
    OrdinalSales(8, 'Aug', 45),
    OrdinalSales(9, 'Sep', 68),
    OrdinalSales(10, 'Oct', 78),
    OrdinalSales(11, 'Nov', 90),
    OrdinalSales(12, 'Dec', 20),
  ];

  final dataPie = [
    OrdinalSalesPie(1, 5),
    OrdinalSalesPie(2, 25),
    OrdinalSalesPie(3, 45),
    OrdinalSalesPie(4, 67),
    OrdinalSalesPie(5, 30),
    OrdinalSalesPie(6, 60),
    OrdinalSalesPie(7, 120),
    OrdinalSalesPie(8, 80),
    OrdinalSalesPie(9, 78),
    OrdinalSalesPie(10, 90),
    OrdinalSalesPie(11, 100),
    OrdinalSalesPie(12, 150),
  ];

  List<charts.Series<OrdinalSales, String>> _createSampleDataForBarChart() {
    return [
      charts.Series<OrdinalSales, String>(
          id: 'SalesPlan',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.name,
          measureFn: (OrdinalSales sales, _) => sales.amount,
          data: dataPlan,
          //tao label
          labelAccessorFn: (OrdinalSales sales, _) =>
              '\$${sales.amount.toString()}'),
    ];
  }

  List<charts.Series<OrdinalSales, int>> _createSampleDataForLineChart() {
    return [
      charts.Series<OrdinalSales, int>(
        id: 'SalesPlan',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.amount,
        data: dataPlan,
        labelAccessorFn: (OrdinalSales sales, _) =>
            '\$${sales.amount.toString()}',
      ),
      charts.Series<OrdinalSales, int>(
        id: 'SalesActual',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.amount,
        data: dataActual,
        labelAccessorFn: (OrdinalSales sales, _) =>
            '\$${sales.amount.toString()}',
      )
    ];
  }

  List<charts.Series<OrdinalSalesPie, int>> _createSampleDataForPieChart() {
    return [
      charts.Series<OrdinalSalesPie, int>(
        id: 'SalesPlan',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSalesPie sales, _) => sales.month,
        measureFn: (OrdinalSalesPie sales, _) => sales.amount,
        data: dataPie,
        labelAccessorFn: (OrdinalSalesPie sales, _) =>
            '${sales.month.toString()}: \$${sales.amount.toString()}',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Charts Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text(
                    'Simple Bar Chart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: charts.BarChart(
                      _createSampleDataForBarChart(),
                      animate: false,
                      //trang tri va hien lable
                      barRendererDecorator:
                          new charts.BarLabelDecorator<String>(
                        insideLabelStyleSpec: const charts.TextStyleSpec(
                            fontSize: 6, color: charts.Color.white),
                        outsideLabelStyleSpec:
                            const charts.TextStyleSpec(fontSize: 6),
                      ),
                    ),
                  ),
                  Expanded(
                    child: charts.BarChart(
                      _createSampleDataForBarChart(),
                      animate: true,
                      vertical: false,
                      barRendererDecorator:
                          new charts.BarLabelDecorator<String>(
                        insideLabelStyleSpec: const charts.TextStyleSpec(
                            fontSize: 6, color: charts.Color.white),
                        outsideLabelStyleSpec:
                            const charts.TextStyleSpec(fontSize: 6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Simple Line Chart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: charts.LineChart(
                      _createSampleDataForLineChart(),
                      animate: true,
                    ),
                  ),
                  const Text(
                    'Simple Pie Chart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: charts.PieChart(
                      _createSampleDataForPieChart(),
                      animate: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class OrdinalSales {
  final int month;
  final String name;
  final int amount;

  OrdinalSales(this.month, this.name, this.amount);
}

class OrdinalSalesPie {
  final int month;
  final int amount;

  OrdinalSalesPie(this.month, this.amount);
}
